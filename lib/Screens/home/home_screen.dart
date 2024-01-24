// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Screens/map_home_screen.dart';
import 'package:p_route/Screens/route_management/route_management_screen.dart';
import 'package:p_route/global/common/utils/app_navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List screens;
  late List<String> iconsNameList = [
    'assets/icons/start_of_day.png',
    'assets/icons/dashboard.png',
    'assets/icons/manage_territories.png',
    'assets/icons/geofencing.png',
    'assets/icons/manage_vehicles.png',
    'assets/icons/route_management.png',
    'assets/icons/delivery_management.png',
    'assets/icons/drivers_management.png',
    'assets/icons/users_management.png',
    'assets/icons/notifications.png',
  ];

  Map fun({
    void Function()? iconTap,
    required String iconImage,
    required String title,
    List<Widget>? subTitles,
  }) {
    return {
      'icon': InkWell(
        onTap: iconTap ?? () {},
        child: CircleAvatar(
          radius: 40,
          child: Image.asset(iconImage, fit: BoxFit.contain),
        ),
      ),
      'title': Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      'subTitles': subTitles ?? <Widget>[],
    };
  }

  @override
  void initState() {
    screens = [
      fun(iconImage: iconsNameList[0], title: "Start Of Day"),
      fun(iconImage: iconsNameList[1], title: "Dashboard"),
      fun(
        iconImage: iconsNameList[2],
        title: "Manage Territories",
        subTitles: <Widget>[
          InkWell(
            child: const Text("Plan & route territories"),
          ),
          InkWell(
            child: const Text("Orders by terrirories"),
          ),
        ],
      ),
      fun(
        iconImage: iconsNameList[3],
        title: "Geofencing",
        subTitles: <Widget>[
          InkWell(
            child: const Text("Zone restrictions"),
          ),
          InkWell(
            child: const Text("Zone terrirories"),
          ),
        ],
      ),
      fun(
        iconImage: iconsNameList[4],
        title: "Manage Vehicles",
        subTitles: <Widget>[
          InkWell(
            child: const Text("Add / Update / Remove"),
          ),
        ],
      ),
      fun(
          iconImage: iconsNameList[5],
          title: "Route Management",
          subTitles: <Widget>[
            InkWell(
              child: const Text("Plan routes"),
            ),
            InkWell(
              onTap: () {
                AppNavigator.goToPage(
                    context: context, screen: const MapHomeScreen());
              },
              child: const Text("Routes map"),
            ),
            InkWell(
              child: const Text("Dispatch routes"),
            ),
          ],
          iconTap: () {
            AppNavigator.goToPage(
              context: context,
              screen: const RouteManagementScreen(),
            );
          }),
      fun(
        iconImage: iconsNameList[6],
        title: "Delivery Management",
        subTitles: <Widget>[
          InkWell(
            child: const Text("List of orders"),
          ),
          InkWell(
            child: const Text("Manual order creation"),
          ),
          InkWell(
            child: const Text("Load and unload orders"),
          ),
        ],
      ),
      fun(
        iconImage: iconsNameList[7],
        title: "Drivers Management",
        subTitles: <Widget>[
          InkWell(
            child: const Text("Add driver"),
          ),
          InkWell(
            child: const Text("Update driver"),
          ),
        ],
      ),
      fun(
        iconImage: iconsNameList[8],
        title: "Users Management",
        subTitles: <Widget>[
          InkWell(
            child: const Text("Add user"),
          ),
          InkWell(
            child: const Text("Update user"),
          ),
        ],
      ),
      fun(
        iconImage: iconsNameList[9],
        title: "Notifications",
        subTitles: <Widget>[
          InkWell(child: const Text("Route notifications")),
          InkWell(child: const Text("Completed notifications")),
          InkWell(child: const Text("Customer notifications")),
          InkWell(child: const Text("Geofence notifications")),
          InkWell(child: const Text("history")),
        ],
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('PRoute Logistics System'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.5,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 0,
              ),
              itemCount: screens.length - 1,
              itemBuilder: (context, index) {
                return HomeIconWidget(
                  icon: screens[index]['icon'],
                  title: screens[index]['title'],
                  subTitles: screens[index]['subTitles'],
                );
              },
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: HomeIconWidget(
                icon: screens[screens.length - 1]['icon'],
                title: screens[screens.length - 1]['title'],
                subTitles: screens[screens.length - 1]['subTitles'],
              ),
            ),
            30.height,
          ],
        ),
      ),
    );
  }
}

class HomeIconWidget extends StatelessWidget {
  const HomeIconWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitles,
  });

  final Widget icon;
  final Widget title;
  final List<Widget> subTitles;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        icon,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            ...subTitles,
          ],
        ),
      ],
    );
  }
}
