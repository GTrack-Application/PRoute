import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Global/common/utils/app_navigator.dart';
import 'package:p_route/Global/widgets/buttons/primary_button.dart';
import 'package:p_route/Global/widgets/text_field/text_field_widget.dart';
import 'package:p_route/Screens/add_new_vehicle_screen.dart';

class ManageVehicleScreen extends StatefulWidget {
  const ManageVehicleScreen({Key? key}) : super(key: key);

  @override
  State<ManageVehicleScreen> createState() => _ManageVehicleScreenState();
}

class _ManageVehicleScreenState extends State<ManageVehicleScreen> {
  var addNewVehicleController = TextEditingController();

  int _selectedIndex = 0;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget tableActive() {
    return Expanded(child: Text("Active"));
  }

  Widget tablePending() {
    return Expanded(child: Text("Pending"));
  }

  Widget tableDeleted() {
    return Expanded(child: Text("Deleted"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Manage Vehicle'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedIndex == 0 ? Colors.orange : Colors.grey,
                    ),
                    onPressed: () => _onButtonPressed(0),
                    child: const Text('Active'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedIndex == 1 ? Colors.orange : Colors.grey,
                    ),
                    onPressed: () => _onButtonPressed(1),
                    child: const Text('Pending'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedIndex == 2 ? Colors.orange : Colors.grey,
                    ),
                    onPressed: () => _onButtonPressed(2),
                    child: const Text('Deleted'),
                  ),
                ],
              ),
              32.height,
              Row(
                children: [
                  Expanded(
                    child: PrimaryButtonWidget(
                      text: "Add new vehicle",
                      onPressed: () {
                        AppNavigator.goToPage(
                          context: context,
                          screen: const AddNewVehicleScreen(),
                        );
                      },
                      backgroungColor: Colors.green,
                    ),
                  ),
                  20.width,
                  Expanded(
                    child: TextFieldWidget(
                      controller: addNewVehicleController,
                      suffixIcon: const Icon(Icons.search),
                      labelText: "Search",
                    ),
                    // Expanded table
                  ),
                ],
              ),
              [tableActive(), tablePending(), tableDeleted()][_selectedIndex],
            ],
          ),
        ));
  }
}
