
import 'package:tentwentyassesment/features/movies/data/models/trailer.dart';

import '../../domain/entities/trailer_result_entity.dart';

class TrailerResult extends TrailerResultEntity {
  TrailerResult({
    required super.trailers,
  });

  factory TrailerResult.fromJson(Map<String, dynamic> json) {
    return TrailerResult(
      trailers: List<Trailer>.from(json['results'].map((trailer) => Trailer.fromJson(trailer))),
    );
  }
}
