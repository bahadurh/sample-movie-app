import '../../data/models/movie_search_result.dart';

abstract class MovieRepository {
  Future<MovieSearchResult> searchMovies(String query, int page);
}
