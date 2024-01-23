import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor, forgroundColor;
  final IconData? icon;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.forgroundColor,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: forgroundColor,
      ),
      child: Row(
        children: [
          Icon(icon).visible(icon != null),
          Text(text.toUpperCase()),
        ],
      ),
    );
  }
}
