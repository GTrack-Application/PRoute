import 'package:flutter/material.dart';
import 'package:p_route/Widgets/app_drawer.dart';

class AssignScreen1 extends StatelessWidget {
  const AssignScreen1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // create three tabs
      body: DefaultTabController(
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
              unselectedLabelColor: Colors.green,
              tabs: [
                Tab(text: 'Assign'),
                Tab(text: 'Unassign'),
                Tab(text: 'History'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    color: Colors.grey[300],
                    child: TabBar(
                      tabs: [
                        Text("data"),
                        Text("data"),
                      ],
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      dividerColor: Colors.black,
                      labelPadding: EdgeInsets.all(20),
                      onTap: (value) {},
                    ),
                  ),
                ],
              ),
              Center(child: Text('Unassign')),
              Center(child: Text('History')),
            ],
          ),
        ),
      ),
    );
  }
}
