import '../../../../common/network/api_config.dart';
import '../../domain/entities/movie_entity.dart';
import 'genre.dart';

class Movie extends MovieEntity {
  Movie({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.releaseDate,
    super.genreIds,
    super.genres,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    final String? posterPath = json['poster_path'];
    final String? backdropPath = json['backdrop_path'];
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: posterPath != null ? ApiConfig.imageBaseUrl + posterPath : null,
      backdropPath: backdropPath != null ? ApiConfig.imageBaseUrl + backdropPath : null,
      genreIds: json['genre_ids'] != null ? List<int>.from(json['genre_ids']) : null,
      genres: json['genres'] != null ? List<Genre>.from(json['genres']?.map((x) => Genre.fromJson(x))) : null,
      releaseDate: json['release_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'release_date': releaseDate,
    };
  }

  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    String? posterPath,
    String? backdropPath,
    List<int>? genreIds,
    List<Genre>? genres,
    String? releaseDate,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      genres: genres ?? this.genres,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }


  static Movie seedRandom() {
    return Movie(
      id: 1,
      title: 'Title',
      overview: 'Overview',
      posterPath: 'https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg',
      backdropPath: 'https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg',
      genreIds: [1, 2],
      genres: [],
      releaseDate: '2021-09-29',
    );
  }
}
