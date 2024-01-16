import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Screens/start_address/start_address_screen.dart';
import 'package:p_route/Widgets/app_text.dart';
import 'package:p_route/global/common/colors/app_colors.dart';
import 'package:p_route/global/common/utils/app_navigator.dart';

class SearchedAddressScreen extends StatefulWidget {
  const SearchedAddressScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchedAddressScreen> createState() => _SearchedAddressScreenState();
}

class _SearchedAddressScreenState extends State<SearchedAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Google map
            Expanded(
              child: Stack(
                children: [
                  const GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(24.7136, 46.6753),
                      zoom: 12.0,
                    ),
                    zoomGesturesEnabled: true,
                    myLocationEnabled: true,
                    compassEnabled: true,
                    indoorViewEnabled: true,
                  ),
                  // back button
                  Positioned(
                      child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
                  Positioned(
                    bottom: 1,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 32,
                      ),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              AppNavigator.goToPage(
                                context: context,
                                screen: const StartAddressScreen(),
                              );
                            },
                            child: const Text(
                              "Enter Start Address",
                              style: TextStyle(
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.mic),
                          5.width,
                          const Icon(Ionicons.camera),
                          5.width,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const ExpansionTile(
              title: Text("6 Stops"),
              subtitle: Text("Expand to see stop details"),
              children: [
                // const ListTile(
                //   title: Text("Streer"),
                //   subtitle: Text("New York City"),
                //   trailing: Icon(Icons.more_vert_outlined),
                // ),
                // 10.height,
                // const ListTile(
                //   leading: Icon(LineIcons.building),
                //   title: Text("Floor"),
                // ),
                // const ListTile(
                //   leading: Icon(LineIcons.tag),
                //   title: Text("Field Service"),
                // ),
                // const ListTile(
                //   leading: Icon(LineIcons.phone),
                //   title: Text("+23005447070"),
                // ),
                // const ListTile(
                //   leading: Icon(LineIcons.check),
                //   title: Text("Stop Time"),
                // ),
                // const ListTile(
                //   leading: Icon(LineIcons.clock),
                //   title: Text("Visit Duration"),
                // ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: context.width() * 0.8,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                child: Container(
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  height: context.height(),
                  child: Center(
                    child: AppText.subHeading(
                      "Settings",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  color: AppColors.dartGreen,
                  height: context.height(),
                  child: Center(
                    child: AppText.normal(
                      "HOLD TO PLAN ROUTE",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
