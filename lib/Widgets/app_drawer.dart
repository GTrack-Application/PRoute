import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nb_utils/nb_utils.dart';
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
            DrawerHeader(
              child: ListTile(
                leading: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/icons/avatar.png'),
                  ),
                ),
                title: GestureDetector(
                  onTap: () {},
                  child: AppText.normal(
                    'Sunie Pham',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: GestureDetector(
                  onTap: () {},
                  child: AppText.normal('sunieux@gmail.com'),
                ),
                trailing: const Icon(Ionicons.moon_outline),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.category_outlined),
                    title: AppText.subHeading('All Categories'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.price_change_outlined),
                    title: AppText.subHeading('Quotes'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.post_add_outlined),
                    title: AppText.subHeading('Post Your RFQ'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: AppText.subHeading('Settings'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.earbuds_outlined),
                    title: AppText.subHeading('Support'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: AppText.subHeading('About Us'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  20.height,
                  ListTile(
                    title: AppText.subHeading('Online Trading'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: AppText.subHeading('Smart Expo'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: AppText.subHeading('Video Channel'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: AppText.subHeading('News Letter'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: AppText.subHeading('Supplier'),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: AppText.subHeading('Buyer'),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                    ),
                    onTap: () {},
                  ),
                  30.height,
                  ListTile(
                    title: AppText.subHeading('Country'),
                    onTap: () {},
                    trailing: DropdownButton(
                      value: 'Pakistan',
                      onChanged: (value) {},
                      items: [
                        DropdownMenuItem(
                          child: AppText.subHeading('Pakistan'),
                          value: 'Pakistan',
                        ),
                        DropdownMenuItem(
                          child: AppText.subHeading('Vietnam'),
                          value: 'Vietnam',
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: AppText.subHeading('Language'),
                    onTap: () {},
                    trailing: DropdownButton(
                      value: 'Eng',
                      onChanged: (value) {},
                      items: [
                        DropdownMenuItem(
                          child: AppText.subHeading('Eng'),
                          value: 'Eng',
                        ),
                        DropdownMenuItem(
                          child: AppText.subHeading('Vie'),
                          value: 'Vie',
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: AppText.subHeading('Currency'),
                    onTap: () {},
                    trailing: DropdownButton(
                      value: 'USD',
                      onChanged: (value) {},
                      items: [
                        DropdownMenuItem(
                          child: AppText.subHeading('USD'),
                          value: 'USD',
                        ),
                        DropdownMenuItem(
                          child: AppText.subHeading('VND'),
                          value: 'VND',
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
