import 'package:flutter/material.dart';
import 'package:tentwentyassesment/core/app_style.dart';
import 'package:tentwentyassesment/core/app_symbols.dart';
import 'package:tentwentyassesment/core/app_utils.dart';
import 'package:tentwentyassesment/features/movies/data/models/movie.dart';

import '../../../../common/widget/network_image.dart';

class SearchItem extends StatelessWidget {
  final Movie item;

  const SearchItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CommonNetWorkImage(imageUrl: item.backdropPath ?? item.posterPath ?? "", height: 100, width: 130),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: textStyle16MediumBlack),
                const SizedBox(height: 4),
                Text(genreName, style: textStyle12MediumGreyNormal),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.more_horiz_outlined, color: AppColors.blueLight, size: 20),
          ),
        ],
      ),
    );
  }

  String get genreName => (item.genreIds?.isNotEmpty ?? false) ? availableGenres[item.genreIds!.first]?.name ?? "" : "unknown";
}
