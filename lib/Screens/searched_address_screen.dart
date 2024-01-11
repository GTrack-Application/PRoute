import 'package:flutter/material.dart';
import 'package:p_route/Global/common/colors/app_colors.dart';
import 'package:p_route/Widgets/button_widget.dart';

class SearchedAddressScreen extends StatefulWidget {
  const SearchedAddressScreen({Key? key}) : super(key: key);

  @override
  State<SearchedAddressScreen> createState() => _SearchedAddressScreenState();
}

class _SearchedAddressScreenState extends State<SearchedAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Google map
          
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: ButtonWidget(
              text: "go to route",
              onPressed: () {},
              backgroundColor: AppColors.grey,
              forgroundColor: AppColors.black,
            ),
          ),
          Expanded(
            child: ButtonWidget(
              text: "add next stop",
              onPressed: () {},
              backgroundColor: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }
}
