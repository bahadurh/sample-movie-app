import 'package:get/get.dart';
import 'package:tentwentyassesment/features/movies/data/models/genre.dart';
import 'package:tentwentyassesment/features/movies/domain/usecases/search_genre_movies_usecase.dart';

import '../../../../core/app_snackbars.dart';
import '../../data/models/movie.dart';

class GenreSearchController extends GetxController {
  final SearchGenreMoviesUseCase _moviesRepository;
  final Genre genre;
  List<Movie> movies = [];
  GenreSearchParam? searchParams;
  bool isLoading = false;
  int page = 1;

  GenreSearchController(this._moviesRepository, this.genre);

  @override
  void onInit() {
    super.onInit();
    final params = GenreSearchParam(genre: genre.id.toString(), page: page);
    _searchMoviesByGenre(params);
  }
  Future<void> _searchMoviesByGenre(GenreSearchParam params) async {
    isLoading = true;
    update();
    final result = await _moviesRepository.call(params);
    if (result.isSuccess) {
      movies = result.data!.movies;
    } else {
      AppSnackbars.showErrorSnack( result.error ?? 'An error occurred');
      movies.clear();
    }
    isLoading = false;
    update();
  }
}
