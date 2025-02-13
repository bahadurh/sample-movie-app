import 'package:flutter/cupertino.dart';
import 'package:tentwentyassesment/common/network/dio_wrapper.dart';
import 'package:tentwentyassesment/features/movies/data/models/genre.dart';

import '../../../../common/usecase/usecase.dart';
import '../repositories/movie_repository.dart';

@immutable
class GetGenresUseCase implements UseCase<List<Genre>, dynamic> {
  final MovieRepository repository;

  const GetGenresUseCase(this.repository);

  @override
  Future<Result<List<Genre>>> call([_]) async {
    return await repository.getGenres();
  }
}