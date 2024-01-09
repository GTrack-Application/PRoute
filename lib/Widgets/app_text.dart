import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  static heading(
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    String? fontFamily,
    double? fontsize,
  }) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontsize ?? 24,
        fontFamily: fontFamily ?? GoogleFonts.inter().fontFamily,
      ),
    );
  }

  static subHeading(
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    String? fontFamily,
    double? fontsize,
  }) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontsize ?? 14,
        fontFamily: fontFamily ?? GoogleFonts.inter().fontFamily,
      ),
    );
  }

  static normal(
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxline,
    double? fontsize,
  }) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: maxline,
      style: TextStyle(
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontsize ?? 12,
        fontFamily: fontFamily ?? GoogleFonts.inter().fontFamily,
      ),
    );
  }
}
