import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Global/common/utils/app_navigator.dart';
import 'package:p_route/Screens/searched_address_screen.dart';
import 'package:p_route/Widgets/app_text.dart';
import 'package:p_route/global/common/colors/app_colors.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Google map
            const Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(24.7136, 46.6753), zoom: 12.0),
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
                      "go to route".toUpperCase(),
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
                onTap: () {
                  AppNavigator.goToPage(
                    context: context,
                    screen: const SearchedAddressScreen(),
                  );
                },
                child: Container(
                  color: AppColors.dartGreen,
                  height: context.height(),
                  child: Center(
                    child: AppText.normal(
                      "add next stop".toUpperCase(),
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
