class MovieEntity {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final List<int> genreIds;
  final String releaseDate;

  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.genreIds,
    required this.releaseDate,
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
          genreIds: [1, 2, 3],
          releaseDate: "2021-09-29",
        );
      },
    );
  }
}
