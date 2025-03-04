import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tentwentyassesment/core/app_style.dart';

import '/di.dart';
import 'features/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// lock orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.greyLight,
        primarySwatch: Colors.indigo,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: HomeScreen(),
      //  home: const NewsView(),
    );
  }
}
