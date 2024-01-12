import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/global/common/colors/app_colors.dart';
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
          20.height,
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
