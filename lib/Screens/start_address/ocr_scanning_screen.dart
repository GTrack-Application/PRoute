import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Screens/start_address/address_scanner_option_screen.dart';
import 'package:p_route/global/common/colors/app_colors.dart';
import 'package:p_route/global/common/utils/app_navigator.dart';

class OCRScanningScreen extends StatefulWidget {
  const OCRScanningScreen({super.key, required this.title});

  final String title;

  @override
  State<OCRScanningScreen> createState() => _OCRScanningScreenState();
}

class _OCRScanningScreenState extends State<OCRScanningScreen> {
  String text = "";
  final StreamController<String> controller = StreamController<String>();

  void setText(value) {
    controller.add(value);
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.asset("assets/icons/location_icon.png"),
                  title: const Text(
                    "Scan Address",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    "Make sure the address fits with the scanner frame and tap on the capture button with the adress is recognised.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              40.height,
              ScalableOCR(
                paintboxCustom: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 4.0
                  ..color = const Color.fromARGB(153, 102, 160, 241),
                boxLeftOff: 5,
                boxBottomOff: 2.5,
                boxRightOff: 5,
                boxTopOff: 2.5,
                boxHeight: MediaQuery.of(context).size.height / 3,
                getRawData: (value) {
                  inspect(value);
                },
                getScannedText: (value) {
                  setText(value);
                },
              ),
              StreamBuilder<String>(
                stream: controller.stream,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return Result(
                    text: snapshot.data != null ? snapshot.data! : "",
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Readed text: $text",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        20.height,
        Visibility(
          visible: text == "" ? false : true,
          child: GestureDetector(
            onTap: () {
              // as I press this button, the scanner should stop and the text should be passed to the next screen
              AppNavigator.goToPage(
                context: context,
                screen: AddressScannerOptionScreen(
                  scannedAddress: text,
                ),
              );
            },
            child: Container(
              width: context.width() * 0.5,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
