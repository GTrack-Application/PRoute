// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:p_route/Widgets/app_text.dart';

class AppTextFieldWidget extends StatefulWidget {
  String? text;
  final String? hint;
  final double? width;
  final double? height;
  final bool? isObsecure;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final int? maxLines;
  final bool? readOnly;
  final Widget? prefixIcon;
  final Widget? suffix;

  AppTextFieldWidget({
    super.key,
    this.hint,
    this.width,
    this.isObsecure,
    this.text,
    required this.controller,
    this.focusNode,
    this.maxLines,
    this.readOnly,
    this.prefixIcon,
    this.suffix,
    this.height,
  });

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 100,
      height: widget.height ?? 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Add borders on all sides
        borderRadius:
            BorderRadius.circular(8), // Adjust the border radius as needed
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.text == null
              ? Container()
              : AppText.normal(
                  widget.text ?? "",
                  fontWeight: FontWeight.w700,
                ),
          TextField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            obscureText: isVisible ? false : widget.isObsecure ?? false,
            readOnly: widget.readOnly ?? false,
            maxLines: widget.maxLines ?? 1,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              suffixIcon: widget.suffix ??
                  (widget.isObsecure!
                      ? (IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ))
                      : null),
              prefixIcon: widget.prefixIcon,
              border: InputBorder.none, // Remove the border line
            ),
          ),
        ],
      ),
    );
  }
}
