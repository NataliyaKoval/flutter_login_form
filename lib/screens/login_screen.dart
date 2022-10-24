import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_form/screens/hello_screen.dart';

const adminLogin = 'admin';
const adminPassword = '123456';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  String login = '';
  String password = '';
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _loginFormKey,
          child: Column(
            children: [
              TextFormField(
                validator: validateLogin,
                decoration: InputDecoration(
                  hintText: 'Enter your login',
                  labelText: 'Login',
                ),
                onChanged: (value) => setState(() => login = value),
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
                onChanged: (value) => setState(() => password = value),
              ),
              SizedBox(
                height: 20.0,
              ),
              CheckboxListTile(
                title: Text('Remember me'),
                controlAffinity: ListTileControlAffinity.leading,
                value: isSelected,
                onChanged: (_) => setState(() => isSelected = !isSelected),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateLogin(value) {
    if (value == null || value.isEmpty) {
      return 'Login must not be empty';
    } else if (value != adminLogin) {
      return 'Please enter a valid login';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password must not be empty';
    } else if (value != adminPassword) {
      return 'Please enter a valid password';
    } else {
      return null;
    }
  }

  void submitForm() {
    final isFormValid = _loginFormKey.currentState!.validate();
    if (isFormValid) {
      rememberUserIfAllowed();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HelloScreen()));
    }
  }

  void rememberUserIfAllowed() async {
    if (isSelected) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
    }
  }
}
