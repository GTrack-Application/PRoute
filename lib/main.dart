import 'package:flutter/material.dart';
import 'package:p_route/Global/themes/themes.dart';
import 'package:p_route/old/screens/login/user_login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PRoute',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme(),
      home: const UserLoginPage(),
    );
  }
}
