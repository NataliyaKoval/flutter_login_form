import 'package:flutter/material.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello screen'),
      ),
      body: Center(
        child: Text('Hello!', style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w500,
          color: Colors.deepPurple,
        ),),
      ),
    );
  }
}
