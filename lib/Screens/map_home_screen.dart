import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/global/common/colors/app_colors.dart';
import 'package:p_route/global/common/utils/app_navigator.dart';
import 'package:p_route/Screens/enter_start_address_screen.dart';
import 'package:p_route/Screens/route_settings_screen.dart';
import 'package:p_route/Widgets/app_drawer.dart';
import 'package:p_route/Widgets/app_text.dart';

class MapHomeScreen extends StatefulWidget {
  const MapHomeScreen({super.key});

  @override
  State<MapHomeScreen> createState() => _MapHomeScreenState();
}

class _MapHomeScreenState extends State<MapHomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawerWidget(),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(24.7136, 46.6753),
              zoom: 12.0,
            ),
            // circles: {
            //   Circle(
            //     circleId: const CircleId('RiyadhCircle'),
            //     center: const LatLng(24.7136, 46.6753),
            //     radius: 10000, // Radius in meters (adjust as needed)
            //     fillColor: Colors.blue.withOpacity(0.3), // Circle fill color
            //     strokeWidth: 2, // Border width
            //     strokeColor: Colors.blue, // Border color
            //   ),
            // },
            buildingsEnabled: true,
            mapToolbarEnabled: true,
            zoomGesturesEnabled: true,
            myLocationEnabled: true,
            // mapType: MapType.terrain,
            compassEnabled: true,
            indoorViewEnabled: true,
            markers: {
              const Marker(
                markerId: MarkerId('Riyadh'),
                position: LatLng(24.7136, 46.6753),
                infoWindow: InfoWindow(title: 'Riyadh'),
                // You can customize the marker icon here if needed
              ),
            },
          ),
          Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    AppNavigator.goToPage(
                      context: context,
                      screen: const StartAddressScreen(),
                    );
                  },
                  child: Container(
                    width: context.width() * 0.8,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: AppText.normal("Enter Start Address"),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Ionicons.mic),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Ionicons.camera),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: context.width() * 0.8,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          color: const Color.fromRGBO(217, 217, 217, 1),
                          height: context.height(),
                          width: context.width() * 0.3,
                          child: Center(
                            child: AppText.subHeading(
                              "Settings",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          color: AppColors.dartGreen,
                          height: context.height(),
                          width: context.width() * 0.5,
                          child: Center(
                            child: AppText.normal(
                              "HOLD TO PLAN ROUTE",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                    icon: const Icon(Ionicons.filter),
                  ),
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
                        PopupMenuItem(
                          value: 2,
                          child: Row(
                            children: [
                              const Icon(Icons.filter_list),
                              5.width,
                              AppText.normal("Route Settings"),
                            ],
                          ),
                        ),
                      ];
                    },
                    onSelected: (value) {
                      if (value == 1) {
                      } else if (value == 2) {
                        AppNavigator.goToPage(
                          context: context,
                          screen: const RouteSettingsScreen(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
