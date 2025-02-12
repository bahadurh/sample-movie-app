import 'package:flutter/material.dart';
import 'package:tentwentyassesment/core/app_style.dart';
import 'package:tentwentyassesment/features/movies/data/models/movie.dart';
import 'package:tentwentyassesment/features/movies/domain/usecases/search_movies_usecase.dart';
import 'package:tentwentyassesment/features/movies/presentation/views/search_movies_delegate.dart';

import '../../../../common/widget/app_bar.dart';
import '../../../../di.dart';
 import '../widgets/movie_item.dart';
import 'movie_detail_view.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({super.key});

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  Future<void> _onSearchTap() async {
    final result = await showSearch(
      context: context,
      delegate: SearchMoviesDelegate(searchMoviesUseCase: getIt<MovieSearchUseCase>()),
    );
    if(result is Movie) {
      _onMovieItemTap(result);
    }
  }

  void _onMovieItemTap(Movie item) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              MovieDetailView(
                  item: item
              )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final moviesList = [];
    return Scaffold(
      appBar: CommonAppBar(
        backgroundColor: AppColors.white,
        title: "Watch",
        actions: [IconButton(onPressed: _onSearchTap, icon: const Icon(Icons.search))],
      ),
      body: ListView.builder(
        itemCount: moviesList.length,
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        itemBuilder: (context, index) {
          final item = moviesList[index];
          return InkWell(
            onTap: () => _onMovieItemTap(item),
            child: MovieItem(item: item),
          );
        },
      ),
    );
  }
}
