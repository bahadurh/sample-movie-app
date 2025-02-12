import 'dart:math';

import 'package:flutter/material.dart';

final Random random = Random();

abstract interface class AppColors {
  static const Color purpleDark = Color(0xff2E2739);
  static const Color purpleNormal = Color(0xff564CA3);
  static const Color greyLight = Color(0xffF6F6FA);
  static const greySemiLight = Color(0xffEFEFEF);
  static const Color greySemiMoreLight = Color(0xff8F8F8F);
  static const Color greyDark = Color(0xff827D88);
  static const Color greyNormal = Color(0xffDBDBDF);
  static const Color blueLight = Color(0xff61C3F2);
  static const Color greenLight = Color(0xff15D2BC);
  static const Color pinkNormal = Color(0xffE26CA5);
  static const Color yellowNormal = Color(0xffCD9D0F);

  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color semiWhite = Color(0xff202C43);
  static  Color semiWhite30 = Color(0xff202C43).withOpacity(.3);

  static const blackGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black],
  );
  static final blackGradient2 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.black.withOpacity(.5), Colors.transparent],
  );

  static List<Color> chipColors = [greenLight, pinkNormal, purpleNormal, yellowNormal];
}

const textStyle18MediumWhite = TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.white);
const textStyle18MediumBlack = TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.black);
const textStyle16MediumWhite = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.white);
const textStyle16MediumBlack = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black);
const textStyle16MediumSemiWhite = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.semiWhite);
const textStyle14SemiBoldWhite = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.white);
const textStyle14SemiBoldBlack = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.black);
const textStyle12SemiBoldWhite = TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.white);
const textStyle12RegularSemiMoreLight = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.greySemiMoreLight);
const textStyle12MediumGreyNormal = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.greyNormal);
const textStyle12BlackNormal = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.black);

const headLine6 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: Colors.grey,
  overflow: TextOverflow.ellipsis,
);

const headLine5 = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

const headLine4 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  overflow: TextOverflow.ellipsis,
);

const headLine3 = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w700,
  overflow: TextOverflow.ellipsis,
);

const headLine2 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  overflow: TextOverflow.ellipsis,
);

const headLine1 = TextStyle(fontSize: 20, fontWeight: FontWeight.w900);

const focusedBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black54, width: 2.0),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const enabledBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black12, width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const errorBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 3, color: Colors.redAccent),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: Colors.redAccent),
);

const focusedErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 3, color: Colors.redAccent),
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
);

extension ColorHelper on AppColors {
  static Color getRandomChipColor(int index) {
    final List<Color> chipColors = AppColors.chipColors;
    return chipColors[index % chipColors.length];
  }
}
