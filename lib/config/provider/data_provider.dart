import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ace_codetest/config/appconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class APIProvider with ChangeNotifier {
  Future apiData(String link) async {
    if (link == "local")
      link = API.local;
    else if (link == "staging")
      link = API.staging;
    else
      link = API.production;
    try {
      final response = await http.get(
        Uri.parse(link),
        headers: {
          "Accept": "application/json",
          'Content-type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data;
      } else {
        throw 'Failed to load ApiData';
      }
    } on FormatException catch (e) {
      print("FormatException" + e.toString());
      throw "Service link's name is not correct !";
    } on TimeoutException catch (e) {
      print("TimeOutExecption" + e.toString());
      throw "Can not connect right now !";
    } on SocketException catch (e) {
      print("SocketException" + e.toString());
      throw "Can not connect right now.Please try again later !";
    } catch (e) {
      print("Api Error");
      throw e.toString();
    }
  }
}
