import '../../../domain/either/either.dart';
import '../../../domain/failures/http_request/http_request_failure.dart';
import '../../../domain/models/movie/movie.dart';
import '../../../domain/models/performer/performer.dart';
import '../../http/http.dart';
import '../utils/hande_failure.dart';

class MoviesAPI {
  MoviesAPI(this._http);
  final Http _http;

  Future<Either<HttpRequestFailure, Movie>> getMovieById(int id) async {
    final result = await _http.request(
      '/movie/$id',
      onSuccess: (json) {
        return Movie.fromJson(json);
      },
    );

    return result.when(
      left: handleHttpFailure,
      right: (movie) => Either.right(movie),
    );
  }

  Future<Either<HttpRequestFailure, List<Performer>>> getCastByMovie(
    int movieId,
  ) async {
    final result = await _http.request(
      '/movie/$movieId/credits',
      onSuccess: (json) {
        final list = json['cast'] as List;
        return list
            .where(
              (e) =>
                  e['known_for_department'] == 'Acting' &&
                  e['profile_path'] != null,
            )
            .map(
              (e) => Performer.fromJson({
                ...e,
                'known_for': []
              }),
            )
            .toList();
      },
    );

    return result.when(
      left: handleHttpFailure,
      right: (cast) => Either.right(cast),
    );
  }
}
