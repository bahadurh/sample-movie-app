import 'package:tentwentyassesment/features/movies/domain/entities/trailer_entity.dart';

class Trailer extends TrailerEntity {
  Trailer({
    required super.id,
    required super.name,
    required super.size,
    required super.url,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) {
    return Trailer(
      id: json['id'],
      name: json['name'],
      size: json['size'],
      url: json['key'],
    );
  }
}
