import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> iconsNameList = [
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

  List<String> titleList = [];

  List<List<Widget>> buttonList = [
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRoute Logistics System'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: iconsNameList.length,
        itemBuilder: (context, index) {
          return HomeIconWidget(
            icon: iconsNameList[index],
          );
        },
      ),
    );
  }
}

class HomeIconWidget extends StatelessWidget {
  const HomeIconWidget({
    super.key,
    required this.icon,
    required this.buttons,
    required this.title,
  });

  final String icon;
  final String title;
  final List<Widget> buttons;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(icon),
      ],
    );
  }
}
