import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Screens/searched_address_screen.dart';
import 'package:p_route/Widgets/app_drawer.dart';
import 'package:p_route/Widgets/app_text.dart';
import 'package:p_route/global/common/colors/app_colors.dart';
import 'package:p_route/global/common/utils/app_navigator.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawerWidget(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: AppColors.primary,
          title: AppText.subHeading(
            "W 34th  St/Penn Plz",
            color: Colors.white,
          ),
          automaticallyImplyLeading: false,
        ),
      ),
      bottomNavigationBar: Container(
        width: context.width() * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: GestureDetector(
          onTap: () {
            AppNavigator.goToPage(
                context: context, screen: const SearchedAddressScreen());
          },
          child: ListTile(
            leading: AppText.subHeading("x", fontsize: 25),
            title: AppText.normal(
              "10 hr 25 min",
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            subtitle: AppText.subHeading(
              "17.7 m  ETA 12:30 AM",
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
              ),
            ),
          ),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(24.7136, 46.6753),
          zoom: 15.0,
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
        mapType: MapType.terrain,
        // trafficEnabled: true,

        myLocationButtonEnabled: true,
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
    );
  }
}
