import 'package:flutter/material.dart';
import 'package:p_route/Constants/app_icons.dart';

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
        'icon': AppIcons.planNewRoute,
      },
      {
        'title': 'Route Settings',
        'icon': AppIcons.routeSettings,
      },
      {
        'title': 'Re-optimized Route',
        'icon': AppIcons.reoptimizeRoute,
      },
      {
        'title': 'Assign User',
        'icon': AppIcons.assignUser,
      },
      {
        'title': 'Refresh Route',
        'icon': AppIcons.refreshRoute,
      },
      {
        'title': 'Share Route',
        'icon': AppIcons.shareRoute,
      },
      {
        'title': 'Export Route',
        'icon': AppIcons.exportRoute,
      },
      {
        'title': 'Delete Route',
        'icon': AppIcons.deleteRoute,
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
