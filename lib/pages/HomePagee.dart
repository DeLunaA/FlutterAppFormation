import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../controllers/auth_controller.dart';

class HomePagee extends StatefulWidget {
  const HomePagee({super.key});

  @override
  State<HomePagee> createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePagee> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: authController.usernameController,
                decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.person)),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: authController.passwordController,
                obscureText: true, // dazz for the hide
                obscuringCharacter: '*', // hide charrrrrbrrrrbrbrbrbrbrb
                decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.password)),
              ),
              const SizedBox(
                height: 45,
              ),
              ElevatedButton(
                  onPressed: () {
                    authController.loginUser();

                    /*if (resfun == true) {
                      Fluttertoast.showToast(
                          msg: "Succ",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 16.0);
                    } else
                      Fluttertoast.showToast(
                          msg: "non",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 16.0);*/
                  },
                  child: Text(
                    'Login',
                  )),
            ],
          ),
        )),
      ),
    );
    ;
  }
}
