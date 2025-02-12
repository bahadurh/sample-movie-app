import 'package:tentwentyassesment/features/movies/data/models/genre.dart';
import 'package:tentwentyassesment/features/movies/data/models/movie.dart';

import '../../../../common/new_network/dio_wrapper.dart';
import '../../data/models/movie_search_result.dart';
import '../../data/models/trailer_result.dart';

abstract class MovieRepository {
  Future<Result<MovieSearchResult>> searchMovies(String query, int page);
  Future<Result<MovieSearchResult>> searchByGenre(String genre, int page);
  Future<Result<List<Genre>>> getGenres();
  Future<Result<Movie>> getMovieDetails(int movieId);
  Future<Result<MovieSearchResult>> getUpcomingMovies(int page);
  Future<Result<TrailerResult>> getMovieTrailer(int movieId);
}
