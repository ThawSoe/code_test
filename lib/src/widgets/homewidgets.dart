import 'package:ace_codetest/src/screens/detail.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  var dataList;
  HomeWidget({Key? key, this.dataList}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Detail(detail: widget.dataList)));
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Name", style: Theme.of(context).textTheme.headline2),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.dataList['name'],
                            style: Theme.of(context).textTheme.headline2),
                        Text('( ' + widget.dataList['username'] + ' )',
                            style: Theme.of(context).textTheme.overline)
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Email", style: Theme.of(context).textTheme.headline2),
                    Text(widget.dataList['email'],
                        style: Theme.of(context).textTheme.headline1)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
