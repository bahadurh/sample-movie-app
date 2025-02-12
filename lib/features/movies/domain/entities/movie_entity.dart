import 'package:tentwentyassesment/features/movies/data/models/genre.dart';

class MovieEntity {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final List<int>? genreIds;
  final List<Genre>? genres;
  final String releaseDate;

  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    this.genreIds,
    this.genres,
  });

  static List<MovieEntity> seed() {
    return List.generate(
      10,
      (index) {
        return MovieEntity(
          id: index,
          title: "Movie $index",
          overview: "Overview $index",
          posterPath: "https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
          backdropPath: "https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
          genreIds: [],
          releaseDate: "2021-09-29",
        );
      },
    );
  }
}
