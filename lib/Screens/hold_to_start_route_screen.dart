import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Global/common/colors/app_colors.dart';
import 'package:p_route/Screens/navigation_screen.dart';
import 'package:p_route/Screens/signature_screen.dart';
import 'package:p_route/Widgets/app_text.dart';
import 'package:p_route/Widgets/button_widget.dart';

import '../global/common/utils/app_navigator.dart';

class HoldToStartRouteScreen extends StatefulWidget {
  const HoldToStartRouteScreen({Key? key}) : super(key: key);

  @override
  State<HoldToStartRouteScreen> createState() => _HoldToStartRouteScreenState();
}

class _HoldToStartRouteScreenState extends State<HoldToStartRouteScreen> {
  late GoogleMapController googleMapController;
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(24.7136, 46.6753),
    zoom: 14.4746,
  );

  final Set<Marker> _markers = {};

  bool showBottom = false;
  bool onArrived = false;

  @override
  void initState() {
    _markers.add(
      Marker(
        markerId: const MarkerId('1'),
        position: const LatLng(24.7136, 46.6753),
        infoWindow: const InfoWindow(
          title: 'Riyadh',
          snippet: 'Riyadh',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: GoogleMap(
                onTap: (argument) {
                  setState(() {
                    showBottom = false;
                    onArrived = false;
                  });
                },
                initialCameraPosition: _initialCameraPosition,
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {
                  googleMapController = controller;
                },
                // plus and minus buttons
                zoomControlsEnabled: true,
              ),
            ),
          ),
          showBottom
              ? Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.house_outlined),
                            title: const Text(
                              'Start Depot',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'Address',
                              style: TextStyle(
                                color: AppColors.black.withOpacity(0.6),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Text("1."),
                            title: const Text(
                              'Daily Delivery',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'Address',
                              style: TextStyle(
                                color: AppColors.black.withOpacity(0.6),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.car_repair_outlined),
                                    5.width,
                                    AppText.subHeading(
                                      "Delivery",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                20.width,
                                AppText.subHeading(
                                  "#1",
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                          10.height,
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Ionicons.location_outline),
                                    5.width,
                                    AppText.subHeading(
                                      "0.5 Mi",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                20.width,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Ionicons.time_outline),
                                    5.width,
                                    AppText.subHeading(
                                      "10:45 PM",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          10.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(width: 20),
                              onArrived
                                  ? Expanded(
                                      child: ButtonWidget(
                                        text: "Arrived",
                                        backgroundColor:
                                            const Color(0xFF57AAAF),
                                        icon: Icons.check,
                                        onPressed: () {
                                          setState(() {
                                            onArrived = true;
                                          });
                                        },
                                      ),
                                    )
                                  : Expanded(
                                      child: ButtonWidget(
                                        text: "Navigate",
                                        backgroundColor: Colors.orange,
                                        icon: Icons.location_on_outlined,
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: AppText.subHeading(
                                                  "Send to Navigation App",
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                content: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ListTile(
                                                      onTap: () {
                                                        AppNavigator.goToPage(
                                                          context: context,
                                                          screen:
                                                              const NavigationScreen(),
                                                        );
                                                      },
                                                      leading: Image.asset(
                                                        "assets/icons/route4me.png",
                                                        height: 30,
                                                        width: 30,
                                                      ),
                                                      title: const Text(
                                                        'Route4Me In-App Navigation',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    ListTile(
                                                      onTap: () {
                                                        AppNavigator.goToPage(
                                                          context: context,
                                                          screen:
                                                              const NavigationScreen(),
                                                        );
                                                      },
                                                      leading: Image.asset(
                                                        "assets/icons/maps.png",
                                                        height: 30,
                                                        width: 30,
                                                      ),
                                                      title: const Text(
                                                        'Maps',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    ListTile(
                                                      onTap: () {
                                                        AppNavigator.goToPage(
                                                          context: context,
                                                          screen:
                                                              const NavigationScreen(),
                                                        );
                                                      },
                                                      leading: Image.asset(
                                                        "assets/icons/copilot_gps.png",
                                                        height: 30,
                                                        width: 30,
                                                      ),
                                                      title: const Text(
                                                        'CoPilot GPS',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    ListTile(
                                                      onTap: () {
                                                        AppNavigator.goToPage(
                                                          context: context,
                                                          screen:
                                                              const NavigationScreen(),
                                                        );
                                                      },
                                                      leading: Image.asset(
                                                        "assets/icons/here_we_go.png",
                                                        height: 30,
                                                        width: 30,
                                                      ),
                                                      title: const Text(
                                                        'HERE WeGo',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    ListTile(
                                                      onTap: () {
                                                        AppNavigator.goToPage(
                                                          context: context,
                                                          screen:
                                                              const NavigationScreen(),
                                                        );
                                                      },
                                                      leading: Image.asset(
                                                        "assets/icons/uber.png",
                                                        height: 30,
                                                        width: 30,
                                                      ),
                                                      title: const Text(
                                                        'Uber',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    ListTile(
                                                      onTap: () {
                                                        AppNavigator.goToPage(
                                                          context: context,
                                                          screen:
                                                              const NavigationScreen(),
                                                        );
                                                      },
                                                      leading: Image.asset(
                                                        "assets/icons/waze.png",
                                                        height: 30,
                                                        width: 30,
                                                      ),
                                                      title: const Text(
                                                        'Waze',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    ListTile(
                                                      onTap: () {
                                                        AppNavigator.goToPage(
                                                          context: context,
                                                          screen:
                                                              const NavigationScreen(),
                                                        );
                                                      },
                                                      leading: Image.asset(
                                                        "assets/icons/zoom.png",
                                                        height: 30,
                                                        width: 30,
                                                      ),
                                                      title: const Text(
                                                        'Zoom',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                              Container(width: 20),
                              onArrived
                                  ? Expanded(
                                      child: ButtonWidget(
                                        text: "Set Status",
                                        backgroundColor: Colors.green,
                                        icon: Icons.check,
                                        onPressed: () {
                                          AppNavigator.goToPage(
                                            context: context,
                                            screen: const SignatureScree(),
                                          );
                                        },
                                      ),
                                    )
                                  : Expanded(
                                      child: ButtonWidget(
                                        text: "Arrived",
                                        backgroundColor: Colors.greenAccent,
                                        icon: Icons.check,
                                        onPressed: () {
                                          setState(() {
                                            onArrived = true;
                                          });
                                        },
                                      ),
                                    ),
                              Container(width: 20),
                            ],
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Text("2."),
                            title: const Text(
                              'Curbside',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'Address',
                              style: TextStyle(
                                color: AppColors.black.withOpacity(0.6),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          10.height,
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.car_repair_outlined),
                                    5.width,
                                    AppText.subHeading(
                                      "Pick Up",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                20.width,
                                AppText.subHeading(
                                  "#2",
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                          10.height,
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Ionicons.location_outline),
                                    5.width,
                                    AppText.subHeading(
                                      "0.7 Mi",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                20.width,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Ionicons.time_outline),
                                    5.width,
                                    AppText.subHeading(
                                      "10:45 PM",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          10.height,
                          const Divider(),
                          10.height,
                          AppText.subHeading(
                              "Predected Route End Time  12:48 PM"),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
      bottomNavigationBar: Visibility(
        visible: !showBottom,
        child: GestureDetector(
          onLongPress: () {
            setState(() {
              showBottom = !showBottom;
            });
          },
          child: Container(
            height: 45,
            alignment: Alignment.center,
            color: AppColors.dartGreen,
            child: Text(
              'Hold to start route'.toUpperCase(),
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
