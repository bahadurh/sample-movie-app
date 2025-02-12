import 'package:tentwentyassesment/features/movies/data/models/movie.dart';
import 'package:tentwentyassesment/features/movies/domain/repositories/movie_repository.dart';

import '../../../../common/new_network/dio_client.dart';
import '../../../../common/new_network/dio_helper.dart';
import '../../../../common/new_network/dio_wrapper.dart';
import '../models/genre.dart';
import '../models/movie_search_result.dart';

class MovieRepositoryImpl extends MovieRepository {
  final DioClient client;

  MovieRepositoryImpl({required this.client});

  @override
  Future<Result<MovieSearchResult>> searchMovies(String query, int page) async {
    final result = await DioHelper.toResult(
      client.get('/search/movie?query=$query&page=$page'),
      (result) => MovieSearchResult.fromJson(result),
    );

    return result;
  }

  @override
  Future<Result<MovieSearchResult>> searchByGenre(String genre, int page) async {
    final result = await DioHelper.toResult(
      client.get('/discover/movie?with_genres=$genre&page=$page'),
      (result) => MovieSearchResult.fromJson(result),
    );

    return result;
  }

  @override
  Future<Result<List<Genre>>> getGenres() async {
    final result = await DioHelper.toResult(
      client.get('/genre/movie/list'),
      (result) {
        final List<Genre> genres = [];
        for (final genre in result['genres']) {
          genres.add(Genre.fromJson(genre));
        }
        return genres;
      },
    );

    return result;
  }

  @override
  Future<Result<Movie>> getMovieDetails(int movieId) async {
    final result = await DioHelper.toResult(
      client.get('/movie/$movieId'),
      (result) {
        return Movie.fromJson(result);
      },
    );

    return result;
  }
}