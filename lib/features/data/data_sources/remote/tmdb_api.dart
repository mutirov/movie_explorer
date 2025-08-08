import 'package:dio/dio.dart';
import 'package:movie_explorer/features/data/models/movie_model.dart';
import 'package:movie_explorer/features/data/models/trailer_model.dart';
import 'package:movie_explorer/features/data/models/tv_model.dart';
import 'package:movie_explorer/core/constants/api_constants.dart';
class TmdbApi {
  final Dio _dio = Dio();

  Future<List<MovieModel>> getResultsByEndpoint(String url) async {
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((item) => MovieModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  Future<List<TvModel>> getTvSeriesByEndpoint(String url) async {
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((item) => TvModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load TV series: ${response.statusCode}');
    }
  }

  Future<TrailerModel> getTrailerByMovieId(int movieId) async {
    final String url = ApiConstants.trailerUrl.replaceFirst('{movie_id}', movieId.toString());
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      return TrailerModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load trailer: ${response.statusCode}');
    }
  }

  Future<List<MovieModel>> getPopularMovies() =>
      getResultsByEndpoint(ApiConstants.popularUrl);
  Future<List<MovieModel>> getTopRatedMovies() =>
      getResultsByEndpoint(ApiConstants.topRatedUrl);
  Future<List<MovieModel>> getUpcomingMovies() =>
      getResultsByEndpoint(ApiConstants.upcomingUrl);
  Future<List<MovieModel>> getNowPlayingMovies() =>
      getResultsByEndpoint(ApiConstants.nowPlayingUrl);

  Future<List<TvModel>> getPopularTvShows() =>
      getTvSeriesByEndpoint(ApiConstants.popularTvUrl);
  Future<List<TvModel>> getTopRatedTvShows() =>
      getTvSeriesByEndpoint(ApiConstants.topRatedTvUrl);
  Future<List<TvModel>> getAiringTodayTvShows() =>
      getTvSeriesByEndpoint(ApiConstants.airingTodayTvUrl);
  Future<List<TvModel>> getOnTheAirTvShows() =>
      getTvSeriesByEndpoint(ApiConstants.onTheAirTvUrl);

  Future<TrailerModel> getTrailer(int movieId) => getTrailerByMovieId(movieId);

}
  // Uncomment the following methods if you want to use them directly


//   Future<List<Results>> getPopularMovies() async {
//     final String url = ApiConstants.popularUrl;
//     print('Fetching popular movies from: $url');
//     final response = await _dio.get(url);
//     if (response.statusCode == 200) {
//       results = (response.data['results'] as List)
//           .map((item) => Results.fromJson(item))
//           .toList();
//     } else {
//       throw Exception('Failed to load popular movies: ${response.statusCode}');
//     }
//     return results;
//   }

//   Future<List<Results>> getTopRatedMovies() async {
//     final String url = ApiConstants.topRatedUrl;
//     final response = await _dio.get(url);
//     if (response.statusCode == 200) {
//       return (response.data['results'] as List)
//           .map((item) => Results.fromJson(item))
//           .toList();
//     } else {
//       throw Exception(
//         'Failed to load top rated movies: ${response.statusCode}',
//       );
//     }
//   }

//  Future<List<Results>> getUpcomingMovies() async {
//     final String url = ApiConstants.upcomingUrl;
//     final response = await _dio.get(url);
//     if (response.statusCode == 200) {
//       return (response.data['results'] as List)
//           .map((item) => Results.fromJson(item))
//           .toList();
//     } else {
//       throw Exception('Failed to load upcoming movies: ${response.statusCode}');
//     }
//   }

//   Future<List<Results>> getNowPlayingMovies() async {
//     final String url = ApiConstants.nowPlayingUrl;
//     final response = await _dio.get(url);
//     if (response.statusCode == 200) {
//       return (response.data['results'] as List)
//           .map((item) => Results.fromJson(item))
//           .toList();
//     } else {
//       throw Exception(
//         'Failed to load now playing movies: ${response.statusCode}',
//       );
//     }
//   }

