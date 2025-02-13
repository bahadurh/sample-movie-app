import 'package:flutter/material.dart';

import '../../../../common/widget/app_svg.dart';
import '../../../../core/app_style.dart';
import '../../data/models/movie_time.dart';

class RoomItem extends StatelessWidget {
  final bool isActive;
  final CinemaHallRoom room;

  const RoomItem({super.key, required this.isActive, required this.room});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "12:30 ", style: textStyle12MediumBlack),
                TextSpan(text: " Cinema", style: textStyle12RegularSemiMoreLight),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.2),
                  offset: Offset(0, 1),
                  blurRadius: 4,
                ),
              ],
              border: Border.all(color: isActive ? AppColors.blueLight : AppColors.greyNormal),
              borderRadius: BorderRadius.circular(10),
            ),
            child: AppSvgAsset(
              "assets/ic/ic_cinema_preview.svg",
              height: 113,
              width: 144,
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "From ", style: textStyle12MediumGreySemiMoreLight),
                TextSpan(text: "${room.prices[0]}\$", style: textStyle12BoldBlack),
                TextSpan(text: " or ", style: textStyle12MediumGreySemiMoreLight),
                TextSpan(text: "${room.prices[1]}\$", style: textStyle12BoldBlack),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
