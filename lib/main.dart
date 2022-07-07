import 'package:flutter/material.dart';

import 'package:chapisco_tv/core/theme/app_theme.dart';
import 'package:chapisco_tv/views/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapisco TV',
      theme: AppTheme.theme,
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}