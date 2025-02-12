import 'package:flutter/cupertino.dart';
import 'package:tentwentyassesment/core/app_style.dart';

class SolidButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final TextStyle textStyle;
  final Color color;
  final double borderRadius;

  const SolidButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.borderRadius,

    this.textStyle = textStyle14SemiBoldWhite,
  });

  factory SolidButton.primary({
    required VoidCallback onPressed,
    required String text,
  }) {
    return SolidButton(
      onPressed: onPressed,
      text: text,
      color: AppColors.blueLight,
      borderRadius: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(vertical: 15),
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(borderRadius),
      color: color,
      child: Text(text, style: textStyle),
    );
  }
}
