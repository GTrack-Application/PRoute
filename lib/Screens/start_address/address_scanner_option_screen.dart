import 'package:flutter/material.dart';

class AddressScannerOptionScreen extends StatefulWidget {
  const AddressScannerOptionScreen({super.key, required this.scannedAddress});

  final String scannedAddress;

  @override
  State<AddressScannerOptionScreen> createState() =>
      _AddressScannerOptionScreenState();
}

class _AddressScannerOptionScreenState
    extends State<AddressScannerOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Scanner Option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.scannedAddress),
          ],
        ),
      ),
    );
  }
}
