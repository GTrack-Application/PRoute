import 'package:flutter/material.dart';
import 'package:p_route/Global/themes/themes.dart';
import 'package:p_route/Screens/map_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PRoute',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme(),
      home: const MapHomeScreen(),
    );
  }
}
