import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Global/common/colors/app_colors.dart';
import 'package:p_route/Widgets/button_widget.dart';

class HoldToStartRouteScreen extends StatefulWidget {
  const HoldToStartRouteScreen({Key? key}) : super(key: key);

  @override
  State<HoldToStartRouteScreen> createState() => _HoldToStartRouteScreenState();
}

class _HoldToStartRouteScreenState extends State<HoldToStartRouteScreen> {
  // google map controller with default location of saudi arabia (riyadh)
  late GoogleMapController _controller;
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(24.7136, 46.6753),
    zoom: 14.4746,
  );

  // markers for the map
  final Set<Marker> _markers = {};

  @override
  void initState() {
    // initialize markers and connect all the markers

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
        body: SafeArea(
          child: GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            markers: _markers,
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
            // plus and minus buttons
            zoomControlsEnabled: true,
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onLongPress: () {
            // show modal bottom sheet
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
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
                      10.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonWidget(
                            text: "Navigate",
                            backgroundColor: Colors.orange,
                            icon: Icons.location_on_outlined,
                            onPressed: () {},
                          ),
                          ButtonWidget(
                            text: "Arrived",
                            backgroundColor: Colors.greenAccent,
                            icon: Icons.check,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Container(
            height: 45,
            alignment: Alignment.center,
            color: AppColors.green,
            child: Text(
              'Hold to start route'.toUpperCase(),
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
          ),
        ));
  }
}
