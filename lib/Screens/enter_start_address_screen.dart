import 'package:flutter/material.dart';
import 'package:input_history_text_field/input_history_text_field.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Widgets/HistoryTextFieldWidget.dart';

class StartAddressScreen extends StatefulWidget {
  const StartAddressScreen({super.key});

  @override
  State<StartAddressScreen> createState() => _StartAddressScreenState();
}

class _StartAddressScreenState extends State<StartAddressScreen> {
  TextEditingController startAddressController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  InputHistoryController searchInputHistoryController =
      InputHistoryController();

  @override
  void initState() {
    searchFocusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              HistoryTextFieldWidget(
                searchController: startAddressController,
                searchFocusNode: searchFocusNode,
                searchInputHistoryController: searchInputHistoryController,
                historyPrefixIcon: Icons.history,
                prefix: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                hintText: 'Enter Start Address',
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.mic,
                        color: Colors.black,
                      ),
                    ),
                    10.width,
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                      ),
                    ),
                    10.width,
                  ],
                ),
              ),
              10.height,
              GestureDetector(
                onTap: () {},
                child: const Row(
                  children: [
                    SizedBox(width: 10.0),
                    Icon(
                      Icons.gps_fixed,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Current Location',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.black),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {},
                child: const Row(
                  children: [
                    SizedBox(width: 10.0),
                    Icon(
                      Icons.timer_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '20 West 34rth Street',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'New York NY USA',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.black),
              40.height,
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'CONNECT CONTACTS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              20.height,
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'IMPORT ADDRESSES',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
