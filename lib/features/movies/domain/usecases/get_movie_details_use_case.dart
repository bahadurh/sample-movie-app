import 'package:flutter/cupertino.dart';
import 'package:tentwentyassesment/common/network/dio_wrapper.dart';
import 'package:tentwentyassesment/features/movies/data/models/genre.dart';

import '../../../../common/usecase/usecase.dart';
import '../../data/models/movie.dart';
import '../repositories/movie_repository.dart';

@immutable
class GetMovieDetailsUseCase implements UseCase<Movie, int> {
  final MovieRepository repository;

  const GetMovieDetailsUseCase(this.repository);

  @override
  Future<Result<Movie>> call(int param) async {
    return await repository.getMovieDetails(param);
  }
}