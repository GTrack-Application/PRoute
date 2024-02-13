// ignore_for_file: unused_field, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Widgets/app_text_feild_widget.dart';
import 'package:p_route/global/common/colors/app_colors.dart';

class TerritoryScreen extends StatefulWidget {
  const TerritoryScreen({Key? key}) : super(key: key);

  @override
  _TerritoryScreenState createState() => _TerritoryScreenState();
}

class _TerritoryScreenState extends State<TerritoryScreen> {
  GoogleMapController? _controller;
  final Set<Polygon> _polygons = {};
  final Set<Marker> _markers = {}; // Set to hold markers

  TextEditingController searchAddressController = TextEditingController();
  TextEditingController searchTerritoryController = TextEditingController();
  FocusNode searchNode = FocusNode();

  bool switchValue = true;

  Map<String, List<dynamic>>? iconsAndFunction;

  var iconColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  List<LatLng> territory1Coords = [
    const LatLng(40.7128, -74.0060),
    const LatLng(40.7355, -74.0019),
    const LatLng(40.7308, -73.9973),
    const LatLng(40.7138, -74.0100),
    const LatLng(40.7130, -74.0200),
  ];

  List<LatLng> territory2Coords = [
    const LatLng(42.7128, -75.0060),
    const LatLng(42.7355, -75.0079),
    const LatLng(42.7308, -75.9973),
    const LatLng(42.7138, -75.0080),
    const LatLng(42.7130, -75.0090),
  ];

  @override
  void initState() {
    super.initState();
    iconsAndFunction = {
      "icon1": [
        Icons.back_hand_outlined,
        () {},
      ],
      "icon2": [
        Icons.area_chart_outlined,
        () {},
      ],
      "icon3": [
        Icons.rectangle_outlined,
        () {},
      ],
      "icon4": [
        Icons.circle_outlined,
        () {},
      ],
      "icon5": [
        Icons.cancel_presentation,
        () {},
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Orders By Territory')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text for Address Book Map/ Generate Order
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Address Book Map/ Generate Order",
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Row for Add New Addresses and Search in Address Book
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.1), // Shadow color
                            spreadRadius: 1, // Spread radius
                            blurRadius: 5, // Blur radius
                            offset: const Offset(0, 2), // Shadow offset
                          ),
                        ],
                        color: Colors.grey[300],
                      ),
                      padding: const EdgeInsets.all(5),
                      width: context.width() * 0.4,
                      child: const Text(
                        "+  Add New Addresses",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // Shadow color
                          spreadRadius: 1, // Spread radius
                          blurRadius: 5, // Blur radius
                          offset: const Offset(0, 2), // Shadow offset
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: AppTextFieldWidget(
                      controller: searchAddressController,
                      focusNode: searchNode,
                      width: context.width() * 0.5,
                      hint: ' Search in Address Book',
                      isObsecure: false,
                      suffix: GestureDetector(
                        child: const Icon(Icons.search_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            10.height,
            // Row for Hide Territorries and Switch
            Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: CustomSwitch(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      const Text("Hide Territorries"),
                      Switch(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: switchValue,
                        activeColor: Colors.grey,
                        onChanged: (value) {
                          setState(
                            () {
                              switchValue = value;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            10.height,
            // Google Map
            SizedBox(
              height: context.height() * 0.4,
              width: context.width() * 1,
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(territory1Coords[0].latitude,
                          territory1Coords[0].longitude),
                      zoom: 10,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller = controller;
                      _addTerritories(); // Call a method to add territories to the map
                      _addMarkers(); // Call a method to add markers to the map
                    },
                    polygons: _polygons,
                    markers: _markers, // Add markers to the map
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      itemCount: iconsAndFunction!.length,
                      padding: const EdgeInsets.all(5),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                for (int i = 0;
                                    i < iconsAndFunction!.length;
                                    i++) {
                                  iconColor[i] = (i == index)
                                      ? Colors.orange
                                      : Colors.white;
                                }
                              },
                            );
                            iconsAndFunction!["icon${index + 1}"]![1]();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: iconColor[index],
                              border: Border.all(color: Colors.grey),
                            ),
                            child:
                                Icon(iconsAndFunction!["icon${index + 1}"]![0]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            10.height,
            // Row for Search in Territories and Draw New Territory
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // Shadow color
                          spreadRadius: 1, // Spread radius
                          blurRadius: 5, // Blur radius
                          offset: const Offset(0, 2), // Shadow offset
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: AppTextFieldWidget(
                      controller: searchTerritoryController,
                      focusNode: searchNode,
                      width: context.width() * 0.5,
                      hint: '  Search in Territories',
                      isObsecure: false,
                      suffix: GestureDetector(
                        child: const Icon(Icons.search_outlined),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.1), // Shadow color
                            spreadRadius: 1, // Spread radius
                            blurRadius: 5, // Blur radius
                            offset: const Offset(0, 2), // Shadow offset
                          ),
                        ],
                        color: Colors.grey[300],
                      ),
                      padding: const EdgeInsets.all(5),
                      width: context.width() * 0.4,
                      child: const Text(
                        "Draw New Territory",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            10.height,
            // DataTable for Territory Counts
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: DataTable(
                columnSpacing: 5,
                border: TableBorder.all(color: Colors.grey[200]!),
                showBottomBorder: true,
                showCheckboxColumn: true,
                columns: [
                  DataColumn(
                    label: Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.visibility_outlined,
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.settings_outlined,
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.workspaces_sharp,
                        ),
                      ),
                    ),
                  ),
                  const DataColumn(
                    label: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text('Name'),
                    ),
                  ),
                  const DataColumn(
                    label: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text('Address Count'),
                    ),
                  ),
                ],
                rows: [],
              ),
            ),
            10.height,
            // Row for Territory Counts
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: context.width() * 0.5,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]!, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    spreadRadius: 1, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: const Offset(0, 2), // Shadow offset
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  // rgba(215, 236, 237, 1)
                  color: const Color.fromARGB(255, 215, 236, 237),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Territory Counts",
                        style:
                            TextStyle(fontSize: 15, color: AppColors.primary),
                      ),
                      10.width,
                      const Icon(Icons.fullscreen)
                    ],
                  ),
                ),
              ),
            ),
            10.height,
          ],
        ),
      ),
    );
  }

  void _addTerritories() {
    // Add polygons for territories
    _polygons.add(
      Polygon(
        polygonId: const PolygonId('territory1'),
        points: territory1Coords,
        strokeWidth: 2,
        strokeColor: Colors.red,
        fillColor: Colors.red.withOpacity(0.35),
      ),
    );

    _polygons.add(
      Polygon(
        polygonId: const PolygonId('territory2'),
        points: territory2Coords,
        strokeWidth: 2,
        strokeColor: Colors.green,
        fillColor: Colors.green.withOpacity(0.35),
      ),
    );

    // Update the map to display the polygons
    setState(() {});
  }

  void _addMarkers() {
    // Define a list to hold all marker positions
    List<LatLng> allMarkerPositions = [];

    // Add markers for territory 1
    for (int i = 0; i < territory1Coords.length; i++) {
      LatLng position = territory1Coords[i];
      allMarkerPositions.add(position); // Add position to the list
      _markers.add(
        Marker(
          markerId: MarkerId('territory1_$i'),
          position: position,
          infoWindow: InfoWindow(title: 'Territory 1 Marker $i'),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }

    // Add markers for territory 2
    for (int i = 0; i < territory2Coords.length; i++) {
      LatLng position = territory2Coords[i];
      allMarkerPositions.add(position); // Add position to the list
      _markers.add(
        Marker(
          markerId: MarkerId('territory2_$i'),
          position: position,
          infoWindow: InfoWindow(title: 'Territory 2 Marker $i'),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }

    // Calculate bounds to fit all markers
    LatLngBounds bounds = _boundsFromLatLngList(allMarkerPositions);

    // Move camera to fit all markers within the bounds
    _controller!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));

    // Update the map to display the markers
    setState(() {});
  }

  LatLngBounds _boundsFromLatLngList(List<LatLng> list) {
    double minLat = list[0].latitude;
    double maxLat = list[0].latitude;
    double minLng = list[0].longitude;
    double maxLng = list[0].longitude;

    for (int i = 1; i < list.length; i++) {
      if (list[i].latitude < minLat) minLat = list[i].latitude;
      if (list[i].latitude > maxLat) maxLat = list[i].latitude;
      if (list[i].longitude < minLng) minLng = list[i].longitude;
      if (list[i].longitude > maxLng) maxLng = list[i].longitude;
    }

    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(0),
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Slider(
            value: _value,
            activeColor: Colors.transparent,
            inactiveColor: Colors.transparent,
            thumbColor: Colors.orange,
            min: 0,
            max: 2,
            divisions: 2,
            label: _value == 0
                ? "All"
                : (_value == 1)
                    ? "Routes"
                    : "Unrouted",
            onChanged: (value) {
              setState(
                () {
                  _value = value;
                },
              );
            },
          ),
        ),
        5.height,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('     All', style: TextStyle(fontSize: 10)),
            Text('     Routed', style: TextStyle(fontSize: 10)),
            Text('Unrouted', style: TextStyle(fontSize: 10)),
          ],
        ),
      ],
    );
  }
}
