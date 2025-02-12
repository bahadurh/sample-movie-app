import 'package:tentwentyassesment/core/app_utils.dart';

import '../../domain/entities/genre_entity.dart';

class Genre extends GenreEntity {
  Genre(super.id, {required super.name, required super.thumbnail});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      int.parse(json['id'].toString()),
      name: json['name'],
      thumbnail: json['thumbnail'] ?? getRandomThumbnail(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Genre &&
      other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}