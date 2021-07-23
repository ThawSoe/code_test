import 'package:ace_codetest/config/provider/check_connection.dart';
import 'package:ace_codetest/config/provider/data_provider.dart';
import 'package:ace_codetest/src/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ACECodeTest());

class ACECodeTest extends StatelessWidget {
  const ACECodeTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CheckConnectionProvider()),
        ChangeNotifierProvider.value(value: APIProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.green,
            textTheme: TextTheme(
                overline: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
                headline1: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                headline2: TextStyle(
                    color: Colors.black,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w300),
                headline3: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
                headline4: TextStyle(
                    color: Colors.black,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w300),
                bodyText1: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
                bodyText2: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.green))),
        home: Home(),
      ),
    );
  }
}
