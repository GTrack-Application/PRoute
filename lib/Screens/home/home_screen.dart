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
      'icon': GestureDetector(
        onTap: iconTap ?? () {},
        child: CircleAvatar(radius: 40, child: Image.asset(iconImage)),
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
          GestureDetector(
            child: const Text("Plan & route territories"),
          ),
          GestureDetector(
            child: const Text("Orders by terrirories"),
          ),
        ],
      ),
      fun(
        iconImage: iconsNameList[3],
        title: "Geofencing",
        subTitles: <Widget>[
          GestureDetector(
            child: const Text("Zone restrictions"),
          ),
          GestureDetector(
            child: const Text("Zone terrirories"),
          ),
        ],
      ),
      fun(
        iconImage: iconsNameList[4],
        title: "Manage Vehicles",
        subTitles: <Widget>[
          GestureDetector(
            child: const Text("Add / Update / Remove"),
          ),
        ],
      ),
      fun(
          iconImage: iconsNameList[5],
          title: "Route Management",
          subTitles: <Widget>[
            GestureDetector(
              child: const Text("Plan routes"),
            ),
            GestureDetector(
              onTap: () {
                AppNavigator.goToPage(
                    context: context, screen: const MapHomeScreen());
              },
              child: const Text("Routes map"),
            ),
            GestureDetector(
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
          GestureDetector(
            child: const Text("List of orders"),
          ),
          GestureDetector(
            child: const Text("Manual order creation"),
          ),
          GestureDetector(
            child: const Text("Load and unload orders"),
          ),
        ],
      ),
      fun(
        iconImage: iconsNameList[7],
        title: "Drivers Management",
        subTitles: <Widget>[
          GestureDetector(
            child: const Text("Add driver"),
          ),
          GestureDetector(
            child: const Text("Update driver"),
          ),
        ],
      ),
      fun(
        iconImage: iconsNameList[8],
        title: "Users Management",
        subTitles: <Widget>[
          GestureDetector(
            child: const Text("Add user"),
          ),
          GestureDetector(
            child: const Text("Update user"),
          ),
        ],
      ),
      fun(
        iconImage: iconsNameList[9],
        title: "Notifications",
        subTitles: <Widget>[
          GestureDetector(
            child: const Text("Route notifications"),
          ),
          GestureDetector(
            child: const Text("Completed notifications"),
          ),
          GestureDetector(
            child: const Text("Customer notifications"),
          ),
          GestureDetector(
            child: const Text("Geofence notifications"),
          ),
          GestureDetector(
            child: const Text("history"),
          ),
        ],
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                childAspectRatio: 0.6,
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
