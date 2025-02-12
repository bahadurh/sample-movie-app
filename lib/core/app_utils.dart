import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

/// Bahadur
/// Consumed from https://api.themoviedb.org/3/genre/movie/list?language=en
/// on 12-Feb-2025
final Map<int, String> availableGenres = {
  28: "Action",
  12: "Adventure",
  16: "Animation",
  35: "Comedy",
  80: "Crime",
  99: "Documentary",
  18: "Drama",
  10751: "Family",
  14: "Fantasy",
  36: "History",
  27: "Horror",
  10402: "Music",
  9648: "Mystery",
  10749: "Romance",
  878: "Science Fiction",
  10770: "TV Movie",
  53: "Thriller",
  10752: "War",
  37: "Western",
};


/// Converting the date string to a formatted date
/// Input date format: yyyy-MM-dd
/// Output date format: MMMM d, y
String dateFormatter(String date) {
  final DateTime dateTime = DateTime.parse(date);
  final String formattedDate = DateFormat("MMMM d, y").format(dateTime);
  return formattedDate;
}