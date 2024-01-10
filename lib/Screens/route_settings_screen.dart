import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Global/common/colors/app_colors.dart';
import 'package:p_route/Widgets/app_text.dart';

class RouteSettingsScreen extends StatefulWidget {
  const RouteSettingsScreen({super.key});

  @override
  State<RouteSettingsScreen> createState() => _RouteSettingsScreenState();
}

class _RouteSettingsScreenState extends State<RouteSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
            title: AppText.subHeading(
              "Route Settings",
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
            ]),
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
            AppText.subHeading(
              "Route Scedule",
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            5.height,
            AppText.subHeading("Janauary 08, 2024    02:22 pm"),
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
                  onTap: () {},
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
