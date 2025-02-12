import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:tentwentyassesment/common/widget/custom_chip.dart';
import 'package:tentwentyassesment/core/app_style.dart';

class MoviesLoadingShimmer extends StatelessWidget {
  const MoviesLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class GenresLoadingShimmer extends StatelessWidget {
  const GenresLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        3,
            (_) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Shimmer(
            child: CustomChip(
              text: "     ", // Empty space for shimmer effect
              backgroundColor: AppColors.greySemiLight,
            ),
          ),
        ),
      ),
    );
  }
}