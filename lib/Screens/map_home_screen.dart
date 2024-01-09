import 'package:flutter/material.dart';
import 'package:p_route/Widgets/app_drawer.dart';

class MapHomeScreen extends StatefulWidget {
  const MapHomeScreen({super.key});

  @override
  State<MapHomeScreen> createState() => _MapHomeScreenState();
}

class _MapHomeScreenState extends State<MapHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Home Screen'),
      ),
      drawer: const AppDrawerWidget(),
      body: Container(),
    );
  }
}
