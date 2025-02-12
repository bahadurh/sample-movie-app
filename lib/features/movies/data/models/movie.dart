import 'package:tentwentyassesment/common/network/api_config.dart';
import '../../domain/entities/movie_entity.dart';

class Movie extends MovieEntity {
  Movie({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.genreIds,
    required super.releaseDate,
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
      genreIds: List<int>.from(json['genre_ids']),
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
}
