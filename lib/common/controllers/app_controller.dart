import 'package:get/get.dart';
import 'package:tentwentyassesment/features/movies/data/models/genre.dart';

/// A global controller that will hold states that
/// are shared across the app
class AppController extends GetxController {
  List<Genre> genres = [];

  void setGenres(List<Genre> genres) {
    this.genres = genres;
    update();
  }
}
