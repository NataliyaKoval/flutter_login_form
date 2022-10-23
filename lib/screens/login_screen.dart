import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: loginFormKey,
          child: Column(
            children: [
              TextFormField(
                validator: validateLogin,
                decoration: InputDecoration(
                  hintText: 'Enter your login',
                  labelText: 'Login',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: true,
                validator: validatePassword,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                ),
              ),
              //Checkbox(value: value, onChanged: (){},),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateLogin(String? value) {
    if (value != null && value.trim().length < 3) {
      return 'Login must be at least 3 characters long';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value != null && value.trim().length < 6) {
      return 'Pass must be at least 6 characters long';
    } else {
      return null;
    }
  }
}
