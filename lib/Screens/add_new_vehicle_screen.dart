import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Global/common/colors/app_colors.dart';
import 'package:p_route/Global/widgets/buttons/primary_button.dart';
import 'package:p_route/Global/widgets/text_field/text_field_widget.dart';
import 'package:p_route/Widgets/dropdowns/dropdown_widget.dart';

class AddNewVehicleScreen extends StatefulWidget {
  const AddNewVehicleScreen({Key? key}) : super(key: key);

  @override
  State<AddNewVehicleScreen> createState() => _AddNewVehicleScreenState();
}

class _AddNewVehicleScreenState extends State<AddNewVehicleScreen> {
  var aliasController = TextEditingController();
  var licensePlateController = TextEditingController();
  var modelController = TextEditingController();
  var vinController = TextEditingController();
  var consumptionCityController = TextEditingController();
  var consumptionHighwayController = TextEditingController();

  // Lists
  List<dynamic> countries = [
    'Afghanistan',
    'Albania',
  ];
  List<dynamic> states = [
    'Albania',
  ];
  List<dynamic> vehicleTypes = [];
  List<dynamic> makes = [];
  List<dynamic> years = [];
  List<dynamic> purchasedYears = [];
  List<dynamic> fuelTypes = [];

  // Selection
  String selectedCountry = '';
  String selectedState = '';
  String selectedVehicleType = '';
  String selectedYear = '';
  String selectedMake = '';
  String selectedFuelType = '';

  Widget twoFieldsWidget(Widget child1, Widget child2) {
    return Row(
      children: [
        Expanded(child: child1),
        10.width,
        Expanded(child: child2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create new vehicle",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Text(
                "Vehicle Information",
                style: TextStyle(color: AppColors.primary, fontSize: 20),
              ),
              10.height,
              twoFieldsWidget(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Alias'),
                    TextFieldWidget(controller: aliasController),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('License Plate'),
                    TextFieldWidget(controller: licensePlateController),
                  ],
                ),
              ),
              twoFieldsWidget(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Make'),
                    DropdownWidget(
                      items: makes
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Model'),
                    TextFieldWidget(controller: modelController),
                  ],
                ),
              ),
              twoFieldsWidget(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('VIN'),
                    TextFieldWidget(controller: vinController),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Vehicle Type'),
                    DropdownWidget(
                      items: vehicleTypes
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              twoFieldsWidget(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Year'),
                    DropdownWidget(
                      items: years
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                Container(),
              ),
              const Divider(),
              const Text(
                "Vehicle Information",
                style: TextStyle(color: AppColors.primary, fontSize: 20),
              ),
              twoFieldsWidget(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Country"),
                    SizedBox(
                        width: double.infinity,
                        child: DropdownButtonFormField<dynamic>(
                          // value: selectedCountry,
                          items: countries
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCountry = value!;
                            });
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: AppColors.grey,
                            hintText: "Country",
                          ),
                        )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("State"),
                    DropdownWidget(
                      items: states
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              twoFieldsWidget(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Year Purchased"),
                    DropdownWidget(
                      items: purchasedYears
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                Container(),
              ),
              const Divider(),
              const Text(
                "Fuel Information",
                style: TextStyle(color: AppColors.primary, fontSize: 20),
              ),
              twoFieldsWidget(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Type"),
                      DropdownWidget(
                        items: fuelTypes
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        hintText: "Type",
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Consumption City"),
                      TextFieldWidget(controller: consumptionCityController),
                    ],
                  )),
              twoFieldsWidget(
                Container(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Consumption Highway"),
                    TextFieldWidget(controller: consumptionHighwayController),
                  ],
                ),
              ),
              10.height,
              twoFieldsWidget(
                  Container(),
                  PrimaryButtonWidget(
                    text: "Add Vehicle",
                    onPressed: () {},
                    backgroungColor: Colors.green,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
