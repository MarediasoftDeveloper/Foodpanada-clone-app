import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda_clone/config/app_colors.dart';
import 'package:foodpanda_clone/config/app_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final bool? isUnderline;
  final int? maxLines;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final TextOverflow textOverflow;
  final AppFont fontFamily;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.isUnderline,
    this.maxLines,
    this.letterSpacing,
    this.textAlign,
    this.textOverflow = TextOverflow.ellipsis,
    this.fontFamily = AppFont.roboto, // Roboto is the default
  });

  @override
  Widget build(BuildContext context) {
    TextStyle getTextStyle() {
      final styleProps = {
        'fontSize': fontSize?.sp ?? 14.sp,
        'fontWeight': fontWeight ?? FontWeight.w400,
        'color': color ?? AppColors.font,
        'letterSpacing': letterSpacing ?? 0.25,
        'decoration': isUnderline == true
            ? TextDecoration.underline
            : TextDecoration.none,
      };

      switch (fontFamily) {
        // --- THIS IS THE UPDATED PART ---
        case AppFont.satoshi:
          // For custom fonts, we use the standard TextStyle widget
          // The 'fontFamily' name must exactly match the 'family:' name in pubspec.yaml
          return TextStyle(
            fontFamily: 'Satoshi', // <-- Use the family name from pubspec.yaml
            fontSize: styleProps['fontSize'] as double,
            fontWeight: styleProps['fontWeight'] as FontWeight,
            color: styleProps['color'] as Color,
            letterSpacing: styleProps['letterSpacing'] as double,
            decoration: styleProps['decoration'] as TextDecoration,
          );
        // --- END OF UPDATE ---

        // Roboto is from Google Fonts, so this part remains the same
        case AppFont.roboto:
        default:
          return GoogleFonts.roboto(
            fontSize: styleProps['fontSize'] as double,
            fontWeight: styleProps['fontWeight'] as FontWeight,
            color: styleProps['color'] as Color,
            letterSpacing: styleProps['letterSpacing'] as double,
            decoration: styleProps['decoration'] as TextDecoration,
          );
      }
    }

    return Text(
      text ?? "",
      maxLines: maxLines ?? 2,
      overflow: textOverflow,
      textAlign: textAlign,
      style: getTextStyle(),
    );
  }
}