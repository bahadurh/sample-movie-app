import 'package:flutter/cupertino.dart';
import 'package:tentwentyassesment/common/new_network/dio_wrapper.dart';

import '../../../../common/usecase/usecase.dart';
import '../../data/models/trailer_result.dart';
import '../repositories/movie_repository.dart';

@immutable
class GetTrailerUserCase implements UseCase<TrailerResult, GetTrailerParams> {
  final MovieRepository repository;

  const GetTrailerUserCase(this.repository);

  @override
  Future<Result<TrailerResult>> call(GetTrailerParams params) async {
    return await repository.getMovieTrailer(params.movieId);
  }
}

@immutable
class GetTrailerParams {
  final int movieId;

  const GetTrailerParams({required this.movieId});
}
