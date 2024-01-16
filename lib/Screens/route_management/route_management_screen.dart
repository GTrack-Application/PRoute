import 'package:flutter/material.dart';

class RouteManagementScreen extends StatefulWidget {
  const RouteManagementScreen({Key? key}) : super(key: key);

  @override
  State<RouteManagementScreen> createState() => _RouteManagementScreenState();
}

class _RouteManagementScreenState extends State<RouteManagementScreen> {
  late List<Map<String, String>> screens;

  @override
  void initState() {
    screens = [
      {
        'title': 'Plan New Route',
        'route': '/add_route',
      },
      {
        'title': 'Route Settings',
        'route': '/add_stop',
      },
      {
        'title': 'Re-optimized Route',
        'route': '/add_route_stop',
      },
      {
        'title': 'Assign User',
        'route': '/add_route_stop_schedule',
      },
      {
        'title': 'Refresh Route',
        'route': '/add_route_stop_schedule',
      },
      {
        'title': 'Share Route',
        'route': '/add_route_stop_schedule',
      },
      {
        'title': 'Export Route',
        'route': '/add_route_stop_schedule',
      },
      {
        'title': 'Delete Route',
        'route': '/add_route_stop_schedule',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(),
    );
  }
}
