import 'package:flutter/material.dart';
import 'package:tentwentyassesment/common/widget/network_image.dart';
import 'package:tentwentyassesment/core/app_style.dart';
import 'package:tentwentyassesment/features/movies/data/models/genre.dart';

class GenreItem extends StatelessWidget {
  final Genre genre;

  const GenreItem({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: CommonNetWorkImage(imageUrl: genre.thumbnail)),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.3),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          bottom: 20,
          child: Text(genre.name, style: textStyle16MediumWhite),
        ),
      ],
    );
  }
}
