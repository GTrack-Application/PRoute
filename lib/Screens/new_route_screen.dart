// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Global/common/utils/app_navigator.dart';
import 'package:p_route/Screens/finish_route_screen.dart';
import 'package:p_route/Widgets/app_text.dart';
import 'package:p_route/global/common/colors/app_colors.dart';

class NewRouteScreen extends StatefulWidget {
  const NewRouteScreen({super.key});

  @override
  State<NewRouteScreen> createState() => _NewRouteScreenState();
}

class _NewRouteScreenState extends State<NewRouteScreen> {
  String date = '';
  String time = '';

  @override
  void initState() {
    super.initState();
    date = DateTime.now().toString().split(' ')[0];
    time = DateTime.now().toString().split(' ')[1].split('.')[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: AppColors.primary,
          title: AppText.subHeading(
            "New Route",
            color: Colors.white,
          ),
          automaticallyImplyLeading: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.question_mark_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            10.height,
            AppText.subHeading(
              "Route Name",
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            10.height,
            AppText.subHeading("Last Mile Optimised Route"),
            5.height,
            const Divider(color: Colors.grey),
            10.height,
            GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025),
                ).then((value) {
                  setState(() {
                    date =
                        "${value.toString().split(' ')[0]} ${value.toString().split(' ')[1].split('.')[0]}";
                  });
                });
              },
              child: SizedBox(
                width: context.width() * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.subHeading(
                      "Route Scedule",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    5.height,
                    AppText.subHeading(
                        "${date.split(' ')[0]} ${time.split(':')[0]}:${time.split(':')[1]}"),
                  ],
                ),
              ),
            ),
            20.height,
            AppText.subHeading(
              "Optimization Type",
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            5.height,
            AppText.subHeading("End Anywhere"),
            20.height,
            AppText.subHeading(
              "Optimize Route Directions for ",
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            5.height,
            AppText.subHeading("Shortest Travel Time with Traffic"),
            20.height,
            AppText.subHeading(
              "Avoid Roads",
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            5.height,
            AppText.subHeading("No Restrictions"),
            20.height,
            AppText.subHeading(
              "Travel Mode",
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            5.height,
            AppText.subHeading("Driving"),
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: () {
                    AppNavigator.goToPage(
                      context: context,
                      screen: const FinishRouteScreen(),
                    );
                  },
                  child: Material(
                    elevation: 5,
                    child: Container(
                      color: AppColors.green,
                      height: context.height() * 0.06,
                      width: context.width() * 0.4,
                      child: Center(
                        child: AppText.subHeading(
                          "Continue",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
