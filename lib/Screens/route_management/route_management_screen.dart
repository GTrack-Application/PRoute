import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Constants/app_icons.dart';
import 'package:p_route/Screens/assign/assign_screen1.dart';
import 'package:p_route/Screens/searched_address_screen.dart';
import 'package:p_route/global/common/utils/app_navigator.dart';

class RouteManagementScreen extends StatefulWidget {
  const RouteManagementScreen({Key? key}) : super(key: key);

  @override
  State<RouteManagementScreen> createState() => _RouteManagementScreenState();
}

class _RouteManagementScreenState extends State<RouteManagementScreen> {
  late List<Map<String, dynamic>> screens;

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
        'onClick': () {
          AppNavigator.goToPage(
            context: context,
            screen: const SearchedAddressScreen(),
          );
        },
      },
      {
        'title': 'Assign User',
        'icon': AppIcons.assignUser,
        'onClick': () {
          AppNavigator.goToPage(
            context: context,
            screen: const AssignScreen1(),
          );
        
        }
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
      appBar: AppBar(
        title: const Text("Route Management"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.7,
          crossAxisSpacing: 16,
          mainAxisSpacing: 32,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: screens
            .map((e) => GestureDetector(
                  onTap: () {
                    if (e.containsKey('onClick')) {
                      e['onClick']();
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(e['icon'].toString()),
                        16.height,
                        Text(e['title'].toString()),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
