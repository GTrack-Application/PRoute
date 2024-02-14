import 'package:flutter/material.dart';
import 'package:p_route/Global/common/colors/app_colors.dart';

class DropdownWidget extends StatelessWidget {
  final dynamic value;
  final List<DropdownMenuItem<dynamic>>? items;
  final void Function(dynamic)? onChanged;
  final String? hintText;

  const DropdownWidget({
    Key? key,
    this.items,
    this.value,
    this.onChanged,
    this.hintText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: DropdownButtonFormField<dynamic>(
          value: value,
          items: items,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: AppColors.grey,
            hintText: hintText,
          ),
        ));
  }
}
