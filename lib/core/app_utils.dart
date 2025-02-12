import 'package:intl/intl.dart';
import 'package:tentwentyassesment/core/app_style.dart';

import '../features/movies/data/models/genre.dart';

/// Bahadur
/// Consumed from https://api.themoviedb.org/3/genre/movie/list?language=en
/// on 12-Feb-2025
final Map<int, Genre> availableGenres = {
  28: Genre(28, name: "Action", thumbnail: getRandomThumbnail()),
  12: Genre(12, name: "Adventure", thumbnail: getRandomThumbnail()),
  16: Genre(16, name: "Animation", thumbnail: getRandomThumbnail()),
  35: Genre(35, name: "Comedy", thumbnail: getRandomThumbnail()),
  80: Genre(80, name: "Crime", thumbnail: getRandomThumbnail()),
  99: Genre(99, name: "Documentary", thumbnail: getRandomThumbnail()),
  18: Genre(18, name: "Drama", thumbnail: getRandomThumbnail()),
  10751: Genre(10751, name: "Family", thumbnail: getRandomThumbnail()),
  14: Genre(14, name: "Fantasy", thumbnail: getRandomThumbnail()),
  36: Genre(36, name: "History", thumbnail: getRandomThumbnail()),
  27: Genre(27, name: "Horror", thumbnail: getRandomThumbnail()),
  10402: Genre(10402, name: "Music", thumbnail: getRandomThumbnail()),
  9648: Genre(9648, name: "Mystery", thumbnail: getRandomThumbnail()),
  10749: Genre(10749, name: "Romance", thumbnail: getRandomThumbnail()),
  878: Genre(878, name: "Science Fiction", thumbnail: getRandomThumbnail()),
  10770: Genre(10770, name: "TV Movie", thumbnail: getRandomThumbnail()),
  53: Genre(53, name: "Thriller", thumbnail: getRandomThumbnail()),
  10752: Genre(10752, name: "War", thumbnail: getRandomThumbnail()),
  37: Genre(37, name: "Western", thumbnail: getRandomThumbnail()),
};

String getRandomThumbnail() {
  return "https://picsum.photos/400/600?random=${random.nextInt(100)}";
}

/// Converting the date string to a formatted date
/// Input date format: yyyy-MM-dd
/// Output date format: MMMM d, y
String dateFormatter(String date) {
  final DateTime dateTime = DateTime.parse(date);
  final String formattedDate = DateFormat("MMMM d, y").format(dateTime);
  return formattedDate;
}