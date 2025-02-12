import 'package:get/get.dart';

import '../../data/models/movie.dart';
import '../../domain/usecases/search_movies_usecase.dart';

class MovieSearchController extends GetxController {
  final MovieSearchUseCase _moviesRepository;
  List<Movie> movies = [];
  MovieSearchParams? searchParams;
  bool isLoading = false;
  int page = 1;

  MovieSearchController(this._moviesRepository);

  @override
  void onInit() {
    super.onInit();
  }

  void setSearchQuery(String query) {
    final params = MovieSearchParams(query: query, page: page);
    searchParams = params;
    if (query.isNotEmpty) {
      _searchMovies(params);
    } else {
      movies.clear();
      update(); // Update the UI manually when the query is cleared
    }
  }

  Future<void> _searchMovies(MovieSearchParams params) async {
    isLoading = true;
    update(); // Trigger a rebuild to show loading state
    final result = await _moviesRepository.call(params);
    if (result.isSuccess) {
      movies = result.data!.movies;
    } else {
      movies.clear();
    }
    isLoading = false;
    update(); // Trigger a rebuild after data is fetched
  }
}
