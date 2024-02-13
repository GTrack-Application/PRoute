import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ViewOrdersScreen extends StatefulWidget {
  const ViewOrdersScreen({Key? key}) : super(key: key);

  @override
  State<ViewOrdersScreen> createState() => _ViewOrdersScreenState();
}

class _ViewOrdersScreenState extends State<ViewOrdersScreen> {
  List<dynamic> orders = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan & Order Territories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Time Period"),
                10.width,
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text("Today"),
                  ),
                ),
              ],
            ),
            20.height,
            Row(
              children: [
                const Text("Filter Order"),
                10.width,
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text("Houston"),
                  ),
                ),
              ],
            ),
            20.height,
            const Divider(),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text("Houseton Order"),
                  subtitle: Text("Hello"),
                  trailing: CircleAvatar(),
                );
              },
              itemCount: 10,
            ))
          ],
        ),
      ),
    );
  }
}
