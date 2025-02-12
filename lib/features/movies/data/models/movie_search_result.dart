import '../../domain/entities/movie_search_result_entity.dart';
import 'movie.dart';

class MovieSearchResult extends MovieSearchResultEntity {
  MovieSearchResult({
    required super.movies,
    required super.totalPages,
    required super.totalResults,
    super.currentPage,
  });

  factory MovieSearchResult.fromJson(Map<String, dynamic> json) {
    return MovieSearchResult(
      currentPage: json['page'],
      movies: List<Movie>.from(json['results'].map((movie) => Movie.fromJson(movie))),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
