
import '../../data/models/movie_search_result.dart';
import '../repositories/movie_repository.dart';

class MovieSearchUseCase {
  final MovieRepository repository;

  MovieSearchUseCase(this.repository);

  Future<MovieSearchResult> execute(String query, int page) async {
    return await repository.searchMovies(query, page);
  }
}