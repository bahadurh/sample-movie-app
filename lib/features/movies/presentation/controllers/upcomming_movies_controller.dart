import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tentwentyassesment/features/movies/data/models/movie.dart';

import '../../domain/usecases/get_upcomming_movies_usecase.dart';
import '../../domain/usecases/search_movies_usecase.dart';

class UpcomingMoviesController extends GetxController {
  final GetUpcomingMoviesUseCase _getUpcomingMoviesUseCase;

  static const int _pageSize = 20; // Adjust based on API response
  final PagingController<int, Movie> pagingController = PagingController(firstPageKey: 1);

  UpcomingMoviesController(this._getUpcomingMoviesUseCase);

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      getUpcomingMovies(pageKey);
    });
  }

  Future<void> getUpcomingMovies(int page) async {
    final result = await _getUpcomingMoviesUseCase.call(
      MovieSearchParams(page: page, query: null),
    );

    if (result.isSuccess) {
      final searchResult = result.data!;
      final isLastPage = searchResult.movies.length < _pageSize;

      if (isLastPage) {
        pagingController.appendLastPage(searchResult.movies);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(searchResult.movies, nextPageKey);
      }
    } else {
      pagingController.error = "Failed to fetch movies";
    }
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}
