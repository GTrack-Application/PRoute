import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Screens/start_address/start_address_screen.dart';
import 'package:p_route/Widgets/app_drawer.dart';
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
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawerWidget(),
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
                  Positioned(
                    top: 10,
                    left: 10,
                    right: 10,
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.menu),
                            onPressed: () {
                              scaffoldKey.currentState!.openDrawer();
                            },
                          ),
                          const Row(
                            children: <Widget>[
                              Icon(
                                Ionicons.location_outline,
                              ),
                              Text("15")
                            ],
                          ),
                          const Row(
                            children: <Widget>[
                              Icon(
                                Icons.timer_outlined,
                              ),
                              Text("12:20")
                            ],
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: PopupMenuButton(
                              surfaceTintColor: Colors.white,
                              itemBuilder: (ctx) {
                                return [
                                  // plane new route
                                  PopupMenuItem(
                                    value: 1,
                                    child: Row(
                                      children: [
                                        const Icon(Icons.gesture_outlined),
                                        5.width,
                                        AppText.normal("Plan New Route"),
                                      ],
                                    ),
                                  ),
                                  // import addresses
                                  PopupMenuItem(
                                    value: 3,
                                    child: Row(
                                      children: [
                                        const Icon(
                                            Icons.import_export_outlined),
                                        5.width,
                                        AppText.normal("Import Addresses"),
                                      ],
                                    ),
                                  ),
                                  // route settings
                                  PopupMenuItem(
                                    value: 2,
                                    child: Row(
                                      children: [
                                        const Icon(Icons.settings_outlined),
                                        5.width,
                                        AppText.normal("Route Settings"),
                                      ],
                                    ),
                                  ),
                                  // Re-optimised route
                                  PopupMenuItem(
                                    value: 4,
                                    child: Row(
                                      children: [
                                        const Icon(Icons.settings_outlined),
                                        5.width,
                                        AppText.normal("Re-optimised route"),
                                      ],
                                    ),
                                  ),
                                  // Assign User
                                  PopupMenuItem(
                                    value: 5,
                                    child: Row(
                                      children: [
                                        const Icon(Icons.people_alt_outlined),
                                        5.width,
                                        AppText.normal("Assign User"),
                                      ],
                                    ),
                                  ),
                                  // Refresh Route
                                  PopupMenuItem(
                                    value: 6,
                                    child: Row(
                                      children: [
                                        const Icon(Icons.refresh_outlined),
                                        5.width,
                                        AppText.normal("Refresh Route"),
                                      ],
                                    ),
                                  ),
                                  // Share Route
                                  PopupMenuItem(
                                    value: 7,
                                    child: Row(
                                      children: [
                                        const Icon(Icons.share_outlined),
                                        5.width,
                                        AppText.normal("Share Route"),
                                      ],
                                    ),
                                  ),
                                  // Export Route
                                  PopupMenuItem(
                                    value: 8,
                                    child: Row(
                                      children: [
                                        const Icon(
                                            Ionicons.document_text_outline),
                                        5.width,
                                        AppText.normal("Export Route"),
                                      ],
                                    ),
                                  ),
                                  // Delete Route
                                  PopupMenuItem(
                                    value: 9,
                                    child: Row(
                                      children: [
                                        const Icon(Icons.delete_outline),
                                        5.width,
                                        AppText.normal("Delete Route"),
                                      ],
                                    ),
                                  ),
                                ];
                              },
                              onSelected: (value) {
                                if (value == 1) {
                                } else if (value == 2) {}
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 1,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.only(
                        left: 1,
                        right: 50,
                        bottom: 2,
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
                          10.width,
                          const Icon(Ionicons.camera),
                          10.width,
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
