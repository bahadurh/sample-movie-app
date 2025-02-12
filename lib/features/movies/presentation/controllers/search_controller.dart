import 'package:get/get.dart';

import '../../data/models/movie.dart';
import '../../domain/usecases/search_movies_usecase.dart';

class MovieSearchController extends GetxController {
  final SearchMoviesUseCase _moviesRepository;
  List<Movie> movies = [];
  MovieSearchParams? searchParams;
  bool isLoading = false;
  int page = 1;

  MovieSearchController(this._moviesRepository);

  void setSearchQuery(String query) {
    final params = MovieSearchParams(query: query, page: page);
    searchParams = params;
    if (query.isNotEmpty) {
      _searchMovies(params);
    } else {
      movies.clear();
      update();
    }
  }

  Future<void> _searchMovies(MovieSearchParams params) async {
    isLoading = true;
    update();
    final result = await _moviesRepository.call(params);
    if (result.isSuccess) {
      movies = result.data!.movies;
    } else {
      movies.clear();
    }
    isLoading = false;
    update();
  }
}
