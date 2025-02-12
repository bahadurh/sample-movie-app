import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwentyassesment/common/widget/app_bar.dart';
import 'package:tentwentyassesment/common/widget/loading_widget.dart';
import 'package:tentwentyassesment/features/movies/presentation/controllers/genre_controller.dart';
import 'package:tentwentyassesment/features/movies/presentation/widgets/search_item.dart';

import '../../../../core/app_style.dart';
import '../../../../di.dart';
import '../../data/models/genre.dart';
import '../../data/models/movie.dart';
import '../../domain/usecases/search_genre_movies_usecase.dart';
import 'movie_detail_view.dart';

class GenreSearchView extends StatelessWidget {
  final Genre genre;

  const GenreSearchView({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GenreSearchController>(
        init: GenreSearchController(getIt<SearchGenreMoviesUseCase>(), genre),
        builder: (controller) {
          String appbarTitle = controller.isLoading ? 'Searching in ${genre.name}...' : "${controller.movies.length} Results Found";
          return Column(
            children: [
              CommonAppBar(title: appbarTitle),
              if (controller.isLoading)
                LoadingWidget()
              else if (controller.movies.isNotEmpty)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 21),
                        child: Text('Top Results', style: textStyle12BlackNormal),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          itemCount: controller.movies.length,
                          itemBuilder: (context, index) {
                            final movie = controller.movies[index];
                            return GestureDetector(
                              onTap: () => _onMovieTap(movie, context: context),
                              child: SearchItem(item: movie),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              else
                Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('No results found.'),
                ))
            ],
          );
        },
      ),
    );
  }

  void _onMovieTap(Movie movie, {required BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailView(item: movie)));
  }

}