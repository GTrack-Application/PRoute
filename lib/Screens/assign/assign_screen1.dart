import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Global/common/colors/app_colors.dart';
import 'package:p_route/Widgets/app_drawer.dart';

class AssignScreen1 extends StatefulWidget {
  const AssignScreen1({Key? key}) : super(key: key);

  @override
  State<AssignScreen1> createState() => _AssignScreen1State();
}

class _AssignScreen1State extends State<AssignScreen1> {
  routeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Choose Option'),
          backgroundColor: AppColors.background,
          shape: Border.all(
            color: Colors.black,
            width: 1,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Open Route'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Change Start Time'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Duplicate Route'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Export Route'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Assign User'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Delete Route'),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  Widget routeListTile({required String title}) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          subtitle: const Text('Route 1'),
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // show dialog
              routeDialog();
            },
          ),
        ),
        const Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const AppDrawerWidget(),
        appBar: AppBar(
          title: const Text("My Routes"),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Sync'),
              Tab(text: 'Search'),
              Tab(text: 'Draft'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.background,
                  bottom: const TabBar(
                    labelColor: Colors.black,
                    automaticIndicatorColorAdjustment: true,
                    unselectedLabelColor: Colors.grey,
                    splashBorderRadius: BorderRadius.all(Radius.circular(10)),
                    tabs: [
                      Tab(text: 'My Routes'),
                      Tab(text: 'All Routes'),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    ListView(
                      children: [
                        routeListTile(title: "Route 1"),
                        routeListTile(title: "Route 2"),
                        routeListTile(title: "Route 3"),
                        routeListTile(title: "Route 4"),
                      ],
                    ),
                    const Center(child: Text('All Routes')),
                  ],
                ),
              ),
            ),
            ListView(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search user by name | email',
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                20.height,
                // come from API
                routeListTile(title: "Route 1"),
                routeListTile(title: "Route 2"),
                routeListTile(title: "Route 3"),
                routeListTile(title: "Route 4"),
              ],
            ),
            const Center(child: Text('Draft')),
          ],
        ),
      ),
    );
  }
}
