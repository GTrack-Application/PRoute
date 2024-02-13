import 'package:flutter/material.dart';

class ManageVehicleScreen extends StatelessWidget {
  const ManageVehicleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Manage Vehicle'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Active'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Pending'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Deleted'),
                ),
              ],
            ),
          ],
        ));
  }
}
