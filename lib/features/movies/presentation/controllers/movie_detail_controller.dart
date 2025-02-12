import 'package:get/get.dart';
import 'package:tentwentyassesment/core/app_snackbars.dart';
import 'package:tentwentyassesment/features/movies/data/models/movie.dart';
import 'package:tentwentyassesment/features/movies/data/models/trailer_result.dart';
import 'package:tentwentyassesment/features/movies/domain/usecases/get_trailer_usercase.dart';

import '../../domain/usecases/get_movie_details_use_case.dart';

class MovieDetailController extends GetxController {
  final Movie _movie;
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetTrailerUserCase getTrailerUserCase;

  MovieDetailController(this._movie, {required this.getMovieDetailsUseCase, required this.getTrailerUserCase});

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

  Future<TrailerResult?> getTrailer() async {
    final result = await getTrailerUserCase.call(GetTrailerParams(movieId: movie.id));
    if (result.isSuccess) {
      return result.data!;
    } else {
      AppSnackbars.showErrorSnack(result.error ?? 'Something went wrong');
    }

    return null;
  }
}
