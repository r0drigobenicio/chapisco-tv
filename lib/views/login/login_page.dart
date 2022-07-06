import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapisco TV'),
      ),
      body: Center(
        child: Text('Login Page', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}