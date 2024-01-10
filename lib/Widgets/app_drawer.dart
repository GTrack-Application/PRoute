import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Global/common/colors/app_colors.dart';
import 'package:p_route/Global/common/utils/app_navigator.dart';
import 'package:p_route/Screens/new_route_screen.dart';
import 'package:p_route/Widgets/app_text.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: context.width() * 0.9,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).padding.top + 10),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: context.width() * 0.8,
              decoration: BoxDecoration(
                // round from right side only
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: const Color(0xFFD3EBEC),
                border: Border.all(
                  color: const Color(0xFFD3EBEC),
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Icon(
                    Ionicons.globe_outline,
                    color: Colors.black,
                  ),
                  10.width,
                  AppText.subHeading(
                    'Routes',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            10.height,
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: 1,
                    onChanged: (value) {},
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.subHeading(
                        'Current Route',
                        fontWeight: FontWeight.bold,
                      ),
                      AppText.normal(
                        '10 Oct 2021 10:00 AM',
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            10.height,
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  const Icon(
                    Ionicons.filter_outline,
                    color: Colors.black,
                  ),
                  10.width,
                  AppText.subHeading(
                    'View All Routes',
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            20.height,
            GestureDetector(
              onTap: () {
                AppNavigator.goToPage(
                  context: context,
                  screen: const NewRouteScreen(),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    const Icon(
                      Ionicons.add_outline,
                      color: Colors.black,
                    ),
                    10.width,
                    AppText.subHeading(
                      'Add New Route',
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
            20.height,
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.note_add_outlined),
                    title: AppText.normal(
                      'Orders',
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Ionicons.book_outline),
                    title: AppText.normal(
                      'Address Book',
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.people_outline),
                    title: AppText.normal(
                      'Team',
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Ionicons.location_outline),
                    title: AppText.normal(
                      'GPS Tracking',
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.settings_outlined),
                    title: AppText.normal(
                      'Settings',
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.help_outline),
                    title: AppText.normal(
                      'Help',
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  20.height,
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: context.width() * 0.8,
                    decoration: BoxDecoration(
                      // round from right side only
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      color: AppColors.dartGreen,
                      border: Border.all(
                        color: const Color(0xFFD3EBEC),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Ionicons.person_add_outline,
                          color: Colors.black,
                          size: 20,
                        ),
                        10.width,
                        AppText.subHeading(
                          'Invite Others',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
