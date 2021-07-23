import 'package:ace_codetest/config/appconfig.dart';
import 'package:ace_codetest/config/provider/check_connection.dart';
import 'package:ace_codetest/config/provider/data_provider.dart';
import 'package:ace_codetest/src/globalwidgets/loading.dart';
import 'package:ace_codetest/src/globalwidgets/toastmessage.dart';
import 'package:ace_codetest/src/widgets/homewidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool noconnection = false;
  bool isLoading = false;
  List dataList = [];
  @override
  void initState() {
    super.initState();
    checkconnection();
  }

  checkconnection() async {
    Provider.of<CheckConnectionProvider>(context, listen: false)
        .checkConnection()
        .then((value) {
      if (value > 0) {
        setState(() {
          noconnection = false;
        });
        apiCall('local');
      } else {
        setState(() {
          noconnection = true;
        });
        ToastMessage.toast(false, Message.failconnection);
      }
    });
  }

  apiCall(String data) async {
    setState(() {
      isLoading = true;
    });
    Provider.of<APIProvider>(context, listen: false).apiData(data).then(
        (value) {
      setState(() {
        isLoading = false;
      });
      print("My get Data");
      print(value.toString());
      dataList = value;
    }, onError: (error) {
      setState(() {
        isLoading = false;
      });
      ToastMessage.toast(false, error.toString());
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      ToastMessage.toast(false, error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var connectionfail = new Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GestureDetector(
        onTap: () {
          checkconnection();
        },
        child: Center(
          child: Image.asset('assets/images/connection.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height),
        ),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Code Test",
            style: TextStyle(fontSize: 19),
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("local"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("staging"),
                  value: 2,
                ),
                PopupMenuItem(
                  child: Text("production"),
                  value: 3,
                ),
              ],
              onSelected: (value) {
                setState(() {
                  apiCall(value.toString());
                });
              },
            ),
            IconButton(
                onPressed: () {
                  checkconnection();
                },
                icon: Icon(Icons.refresh_outlined))
          ],
        ),
        body: noconnection
            ? connectionfail
            : isLoading
                ? Loading()
                : ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (BuildContext context, index) {
                      return HomeWidget(
                        dataList: dataList[index],
                      );
                    }));
  }
}
