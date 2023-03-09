import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AuthController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future loginUser() async {
    var response = await http.post(Uri.parse("http://10.0.2.2:8080/api/login"),
        headers: {"Content-type": "application/json"},
        body: json.encode({
          'username': usernameController.text,
          'password': passwordController.text,
        }));

    print(response.statusCode);

    if (response.statusCode == 200) {
      var body = response.body;
      //var loginArr = json.decode(response.body);
      print(body);
      print("Response Status :  ${response.statusCode}");
      return Fluttertoast.showToast(
          msg: "Loged in",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    } else {
      print("Response Status :  ${response.statusCode}");
      print("login error ! ");
      print(usernameController);
      return Fluttertoast.showToast(
          msg: "err",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  } 
  }

