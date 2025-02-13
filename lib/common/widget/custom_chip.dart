import 'package:flutter/material.dart';

import '../../core/app_style.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final Color backgroundColor;


  const CustomChip({super.key, required this.text, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text, style: textStyle12SemiBoldWhite),
      visualDensity: VisualDensity.compact,
      backgroundColor: backgroundColor,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.transparent)),
    );
  }
}

class CustomChipSecondary extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final double borderRadius;
  final bool isActive;

  const CustomChipSecondary({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.borderRadius = 10,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
       if(isActive)   BoxShadow(
            color:  backgroundColor.withOpacity(0.4),
            offset: Offset(0, 0),
            blurRadius: 21,
          ),
        ],
      ),
      child: Chip(
        label: Text(text, style: isActive? textStyle12SemiBoldWhite: textStyle12SemiBoldBlack),
        visualDensity: VisualDensity.compact,
        backgroundColor: isActive? backgroundColor : AppColors.greyNormal.withOpacity(.4),
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
