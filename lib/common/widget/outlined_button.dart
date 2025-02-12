import 'package:flutter/material.dart';
import 'package:tentwentyassesment/core/app_style.dart';

class OutlinedButtonIcon extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle textStyle;
  final double borderRadius;
  final Color borderColor;
  final Widget icon;

  const OutlinedButtonIcon({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle = const TextStyle(fontWeight: FontWeight.w600),
    this.borderRadius = 10.0,
    this.borderColor = Colors.blue,
    required this.icon,
  });

  factory OutlinedButtonIcon.primary({
    required VoidCallback onPressed,
    required String text,
    required Widget icon,
  }) {
    return OutlinedButtonIcon(
      onPressed: onPressed,
      text: text,
      borderColor: AppColors.blueLight,
      textStyle: textStyle14SemiBoldWhite,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,

      style: ButtonStyle(

        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        side: WidgetStateProperty.all(BorderSide(color: borderColor)),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
      ),
      icon: icon,
      label: Text(text, style: textStyle),
    );
  }
}
