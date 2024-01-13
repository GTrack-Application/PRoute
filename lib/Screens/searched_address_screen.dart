import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Widgets/app_text.dart';
import 'package:p_route/global/common/colors/app_colors.dart';

class SearchedAddressScreen extends StatefulWidget {
  const SearchedAddressScreen({
    Key? key,
    required this.scannedAddress,
    required this.scanningMode,
  }) : super(key: key);

  final String scannedAddress;
  final String scanningMode;

  @override
  State<SearchedAddressScreen> createState() => _SearchedAddressScreenState();
}

class _SearchedAddressScreenState extends State<SearchedAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Google map
            const Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(24.7136, 46.6753),
                  zoom: 12.0,
                ),
                zoomGesturesEnabled: true,
                myLocationEnabled: true,
                compassEnabled: true,
                indoorViewEnabled: true,
              ),
            ),
            const ListTile(
              title: Text("Streer"),
              subtitle: Text("New York City"),
              trailing: Icon(Icons.more_vert_outlined),
            ),
            10.height,
            const ListTile(
              leading: Icon(LineIcons.building),
              title: Text("Floor"),
            ),
            const ListTile(
              leading: Icon(LineIcons.tag),
              title: Text("Field Service"),
            ),
            const ListTile(
              leading: Icon(LineIcons.phone),
              title: Text("+23005447070"),
            ),
            const ListTile(
              leading: Icon(LineIcons.check),
              title: Text("Stop Time"),
            ),
            const ListTile(
              leading: Icon(LineIcons.clock),
              title: Text("Visit Duration"),
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
