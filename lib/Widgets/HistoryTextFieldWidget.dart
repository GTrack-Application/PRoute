import 'package:flutter/material.dart';
import 'package:input_history_text_field/input_history_text_field.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nb_utils/nb_utils.dart';

class HistoryTextFieldWidget extends StatefulWidget {
  const HistoryTextFieldWidget({
    super.key,
    required this.searchController,
    required this.searchFocusNode,
    required this.searchInputHistoryController,
    this.width,
    this.height,
    this.onEditingComplete,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.suffix,
    this.prefix,
    this.historyPrefixIcon,
    this.deleteIcon,
  });

  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  final InputHistoryController searchInputHistoryController;
  final double? width;
  final double? height;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final Widget? suffix;
  final Widget? prefix;
  final IconData? historyPrefixIcon;
  final IconData? deleteIcon;

  @override
  State<HistoryTextFieldWidget> createState() => _HistoryTextFieldWidgetState();
}

class _HistoryTextFieldWidgetState extends State<HistoryTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? context.width() * 0.9,
      height: widget.height ?? context.height() * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[100]!,
        ),
      ),
      margin: const EdgeInsets.all(10),
      child: InputHistoryTextField(
        onEditingComplete: widget.onEditingComplete,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        onTap: widget.onTap,
        historyKey: "01",
        limit: 5,
        textEditingController: widget.searchController,
        focusNode: widget.searchFocusNode,
        historyIconColor: Colors.black,
        showHistoryIcon: true,
        showDeleteIcon: true,
        historyIcon: widget.historyPrefixIcon ?? Ionicons.time_outline,
        deleteIcon: widget.deleteIcon ?? Ionicons.close_outline,
        enableFilterHistory: true,
        inputHistoryController: widget.searchInputHistoryController,
        enableSave: true,
        enableSuggestions: true,
        enabled: true,
        enableHistory: true,
        autocorrect: true,
        backgroundColor: Colors.white,
        textInputAction: TextInputAction.search,
        // remove the underline
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          prefixIcon: widget.prefix ??
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Ionicons.search_outline,
                  color: Colors.black,
                ),
              ),
          suffixIcon: widget.suffix,
        ),
      ),
    );
  }
}
