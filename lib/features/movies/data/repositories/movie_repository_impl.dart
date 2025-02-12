import 'package:tentwentyassesment/features/movies/domain/repositories/movie_repository.dart';

import '../../../../common/new_network/dio_client.dart';
import '../../../../common/new_network/dio_helper.dart';
import '../../../../common/new_network/dio_wrapper.dart';
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
}