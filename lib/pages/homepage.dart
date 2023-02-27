import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
                  },
                  child: Text(
                    'Login',
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
