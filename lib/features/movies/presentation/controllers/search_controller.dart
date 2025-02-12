import 'package:get/get.dart';
import 'package:tentwentyassesment/common/controllers/app_controller.dart';
import 'package:tentwentyassesment/core/app_snackbars.dart';
import 'package:tentwentyassesment/features/movies/data/models/genre.dart';

import '../../data/models/movie.dart';
import '../../domain/usecases/get_genres_usecase.dart';
import '../../domain/usecases/search_movies_usecase.dart';

class MovieSearchController extends GetxController {
  final SearchMoviesUseCase _searchMoviesUseCase;
  final GetGenresUseCase _getGenresUseCase;
  List<Movie> movies = [];
  List<Genre> genres = [];

  MovieSearchParams? searchParams;
  bool isLoading = false;
  bool isGenreLoading = false;
  int page = 1;

  MovieSearchController(this._searchMoviesUseCase, this._getGenresUseCase);

  @override
  void onInit() {
    super.onInit();
    loadGenres();
  }

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
    final result = await _searchMoviesUseCase.call(params);
    if (result.isSuccess) {
      movies = result.data!.movies;
    } else {
      movies.clear();
    }
    isLoading = false;
    update();
  }

  Future<void> loadGenres() async {
    final loadedGenres = Get.find<AppController>().genres;
    if (loadedGenres.isNotEmpty) {
      genres = loadedGenres;
      update();
      return;
    }
    isGenreLoading = true;
    update();
    final result = await _getGenresUseCase.call(null);
    if (result.isSuccess) {
      genres = result.data!;
      Get.find<AppController>().genres = genres;
    } else {
      AppSnackbars.showErrorSnack(result.error ?? "Something went wrong");
    }
    isGenreLoading = false;
    update();
  }
}
