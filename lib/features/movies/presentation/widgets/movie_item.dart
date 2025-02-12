import 'package:flutter/material.dart';
import 'package:tentwentyassesment/common/widget/network_image.dart';
import 'package:tentwentyassesment/core/app_style.dart';
import 'package:tentwentyassesment/features/movies/data/models/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie item;

  const MovieItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final borderRadiusBottom = BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Hero(
            tag: item.id,
            child: CommonNetWorkImage(
              imageUrl: item.backdropPath ?? item.posterPath ?? "",
              height: 180,
              width: double.infinity,
            ),
          ),
          // Gradient Overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              decoration: BoxDecoration(borderRadius: borderRadiusBottom, gradient: AppColors.blackGradient),
            ),
          ),

          // Title Text
          Positioned(bottom: 20, left: 20, child: Text(item.title, style: textStyle18MediumWhite)),
        ],
      ),
    );
  }
}
