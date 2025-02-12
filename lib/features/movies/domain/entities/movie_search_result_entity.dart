import 'package:tentwentyassesment/features/movies/data/models/movie.dart';

class MovieSearchResultEntity {
  final int? currentPage;
  final List<Movie> movies;
  final int totalPages;
  final int totalResults;

  MovieSearchResultEntity({
    this.currentPage,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });
}