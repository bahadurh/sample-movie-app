import 'package:get/get.dart';
import 'package:tentwentyassesment/core/app_snackbars.dart';
import 'package:tentwentyassesment/features/movies/data/models/movie.dart';
import 'package:tentwentyassesment/features/movies/domain/usecases/getMovieDetailsUseCase.dart';

class MovieDetailController extends GetxController {
  final Movie _movie;
  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  MovieDetailController(this._movie, {required this.getMovieDetailsUseCase});

  late Movie movie;

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    movie = _movie.copyWith();
    getMovieDetails();
  }

  void getMovieDetails() async {
    isLoading = true;
    final result = await getMovieDetailsUseCase.call(movie.id);
    if (result.isSuccess) {
      movie = movie.copyWith(genres: result.data!.genres);
    } else {
      AppSnackbars.showErrorSnack(result.error ?? 'Something went wrong');
    }
    isLoading = false;
    update();
  }
}
