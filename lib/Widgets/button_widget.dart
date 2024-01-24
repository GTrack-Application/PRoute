import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Widgets/app_text.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor, forgroundColor;
  final IconData? icon;
  final double? width;
  final double? height;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.forgroundColor,
    this.icon,
    this.width,
    this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: forgroundColor,
      ),
      child: Row(
        children: [
          Icon(icon).visible(icon != null),
          5.width,
          AppText.subHeading(
            text,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
