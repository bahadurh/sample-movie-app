
import 'package:tentwentyassesment/features/movies/domain/repositories/movie_repository.dart';

import '../../../../common/network/dio_client.dart';
import '../../domain/entities/movie_result_entity.dart';
import '../models/movie_search_result.dart';

class MovieRemoteDataSourceImpl implements MovieRepository {
  final DioClient dio;

  MovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<MovieSearchResult> searchMovies(String query, int page) async {
    final response = await dio.get(
      '/search/movie',
      queryParameters: {
        'query': query,
        'page': page,
      },
    );

    if (response.statusCode == 200) {
      return MovieSearchResult.fromJson(response.data);
    } else {
      throw Exception('Failed to load movies');
    }
  }
}