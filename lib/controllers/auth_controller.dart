import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AuthController {
  bool res = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future loginUser() async {
    var response = await http.post(Uri.parse("http://10.0.2.2:8080/api/login"),
        headers: {"Content-type": "application/json"},
        body: json.encode({
          'username': usernameController.text,
          'password': passwordController.text,
        }));

    if (response.statusCode == 200) {
      var loginArr = json.decode(response.body).cast<Map<String, dynamic>>();
      print(response.body);
      return res = true;
    } else {
      print("Response Status :  ${response.statusCode}");
      print("login error ! ");
      return res = false;
    }
  }
}
