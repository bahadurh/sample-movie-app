import 'package:tentwentyassesment/features/movies/data/models/movie.dart';

class MovieSearchResultEntity {
  final List<Movie> movies;
  final int totalPages;
  final int totalResults;

  MovieSearchResultEntity({
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });
}