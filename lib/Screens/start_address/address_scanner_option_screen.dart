import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Screens/searched_address_screen.dart';
import 'package:p_route/global/common/utils/app_navigator.dart';

class AddressScannerOptionScreen extends StatefulWidget {
  const AddressScannerOptionScreen({
    super.key,
    required this.scannedAddress,
  });

  final String scannedAddress;

  @override
  State<AddressScannerOptionScreen> createState() =>
      _AddressScannerOptionScreenState();
}

class _AddressScannerOptionScreenState
    extends State<AddressScannerOptionScreen> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Address Scanner Option',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        // back button
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            10.height,
            Center(
              child: Container(
                width: context.width() * 0.9,
                height: context.height() * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFD7ECEC),
                  border: Border.all(
                    color: Colors.grey[100]!,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    AppNavigator.replaceTo(
                      context: context,
                      screen: SearchedAddressScreen(
                        scannedAddress: widget.scannedAddress,
                        scanningMode: _value == 1
                            ? "Manual Scanning Mode"
                            : "Automatic Scanning Mode",
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(100),
                    child: Image.asset(
                      'assets/icons/location_icon.png',
                      fit: BoxFit.contain,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
            ),
            10.height,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Scanning Mode',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            10.height,
            // two radio tiles for scanning mode
            RadioListTile<int>(
              title: const Text(
                'Manual Scanning Mode',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Point your camera at the address and tap on the capture button once the adress is recognize',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              value: 1,
              groupValue: _value,
              onChanged: (value) {
                setState(() {
                  _value = value!;
                });
              },
            ),
            10.height,
            RadioListTile<int>(
              title: const Text(
                'Automatic Scanning Mode',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Point your camera at the address and hold until the adress is automatically recognize',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              value: 2,
              groupValue: _value,
              onChanged: (value) {
                setState(() {
                  _value = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
