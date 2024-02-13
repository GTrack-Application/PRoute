import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Screens/finish_route_screen.dart';
import 'package:p_route/Widgets/app_text.dart';
import 'package:p_route/Widgets/app_text_feild_widget.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../global/common/colors/app_colors.dart';
import '../global/common/utils/app_navigator.dart';

class SignatureScree extends StatefulWidget {
  const SignatureScree({super.key});

  @override
  State<SignatureScree> createState() => _SignatureScreeState();
}

class _SignatureScreeState extends State<SignatureScree> {
  TextEditingController notesController = TextEditingController();

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            AppNavigator.goToPage(
              context: context,
              screen: const FinishRouteScreen(),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.dartGreen,
          ),
          child: const Text(
            "Mark As Done",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: context.height() * 0.12,
                    width: context.width() * 0.27,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/icons/failed_icon.png"),
                        const Text(
                          'FAILED',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: context.height() * 0.12,
                    width: context.width() * 0.27,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/icons/skipped_icon.png"),
                        const Text(
                          'SKIPPED',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: context.height() * 0.12,
                    width: context.width() * 0.27,
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/icons/done_icon.png"),
                        const Text(
                          'DONE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              20.height,
              AppText.subHeading(
                "Optional Task",
                fontWeight: FontWeight.bold,
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Image.asset("assets/icons/note_icon.png"),
                      10.width,
                      AppText.subHeading("Notes", fontWeight: FontWeight.bold)
                    ],
                  ),
                  Row(
                    children: [
                      // green checked button with around circle
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.green),
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 18,
                          color: AppColors.green,
                        ),
                      ),
                      const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 30,
                      )
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 245, 250),
                  border: Border.all(),
                ),
                child: AppTextFieldWidget(
                  controller: notesController,
                  isObsecure: false,
                  maxLines: 1,
                  width: context.width() * 8,
                ),
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Image.asset("assets/icons/signature_icon.png"),
                      10.width,
                      AppText.subHeading(
                        "Signature",
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColors.green),
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 18,
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
              10.height,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 138, 204, 239),
                  ),
                ),
                height: context.height() * 0.2,
                width: context.width() * 9,
                child: SfSignaturePad(
                  key: _signaturePadKey,
                  minimumStrokeWidth: 1,
                  maximumStrokeWidth: 3,
                  strokeColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Image.asset("assets/icons/photos_icon.png"),
                      10.width,
                      AppText.subHeading(
                        "Photos",
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColors.green),
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 18,
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
              10.height,
              Row(
                children: [
                  Container(
                    width: context.width() * 0.3,
                    height: context.height() * 0.12,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.green, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset("assets/images/item_image.png"),
                  ),
                  10.width,
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
