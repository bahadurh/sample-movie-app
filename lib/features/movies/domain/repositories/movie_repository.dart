import 'package:dartz/dartz.dart';

import '../../../../common/new_network/dio_wrapper.dart';
import '../../data/models/movie_search_result.dart';

abstract class MovieRepository {
  Future<Result<MovieSearchResult>> searchMovies(String query, int page);

}
