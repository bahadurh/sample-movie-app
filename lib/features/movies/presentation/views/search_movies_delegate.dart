import 'package:flutter/material.dart';
import 'package:tentwentyassesment/core/app_style.dart';
import 'package:tentwentyassesment/features/movies/data/models/movie_search_result.dart';
 import 'package:tentwentyassesment/features/movies/domain/usecases/search_movies_usecase.dart';

import '../../data/models/movie.dart';


class SearchMoviesDelegate extends SearchDelegate {
  final MovieSearchUseCase searchMoviesUseCase;
  int currentPage = 1;
  List<Movie> movies = [];

  SearchMoviesDelegate({required this.searchMoviesUseCase});

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      primaryColor: AppColors.white,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = "",
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  Future<void> fetchMovies(BuildContext context) async {
    final result = await searchMoviesUseCase.execute(query, currentPage);
    if (result.movies.isNotEmpty) {
      movies.addAll(result.movies);
      currentPage++; // Increment page
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<MovieSearchResult>(
      future: searchMoviesUseCase.execute(query, currentPage),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.movies.length,
            itemBuilder: (context, index) {
              final movie = movies.movies[index];
              return ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.releaseDate),
                onTap: () => close(context, movie),
              );
            },
          );
        } else {
          return Center(child: Text('No results found.'));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(); // Suggestions handling can be added here if needed
  }
}
