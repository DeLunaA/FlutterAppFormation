import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AuthController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future loginUser() async {
    var response = await http.post(Uri.parse("http://10.0.2.2:8080/api/login"),
        headers: <String, String>{"Content-type": "application/json"},
        body: jsonEncode({
          "username": usernameController.text,
          "password": passwordController.text,
        }));

    if (response.statusCode == 200) {
      var loginArr = json.decode(response.body);
      print(loginArr['token']);
      Fluttertoast.showToast(
          msg: "Succ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    } else {
      print("Response Status :  ${response.statusCode}");
      print("login error ! ");
    }
  }
}
