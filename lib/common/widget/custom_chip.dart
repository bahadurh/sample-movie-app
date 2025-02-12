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
