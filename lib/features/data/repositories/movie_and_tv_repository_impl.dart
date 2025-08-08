
import 'package:movie_explorer/features/data/data_sources/remote/tmdb_api.dart';
import 'package:movie_explorer/features/data/models/movie_model.dart';
import 'package:movie_explorer/features/data/models/trailer_model.dart';
import 'package:movie_explorer/features/data/models/tv_model.dart';
import 'package:movie_explorer/features/domain/repositories/movie_and_tv_repository.dart';

class MovieAndTvRepositoryImpl implements MovieAndTvRepository {
  final TmdbApi _tmdbApi;

  MovieAndTvRepositoryImpl(this._tmdbApi);

  @override
  Future<List<MovieModel>> getNowPlayingMovies() {
    return _tmdbApi.getNowPlayingMovies();
  }

  @override
  Future<List<MovieModel>> getPopularMovies() {
    return _tmdbApi.getPopularMovies();
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() {
    return _tmdbApi.getTopRatedMovies();
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() {
    return _tmdbApi.getUpcomingMovies();
  }

@override
  Future<List<TvModel>> getPopularTvShows() {
    return _tmdbApi.getPopularTvShows();
  }

  @override
  Future<List<TvModel>> getTopRatedTvShows() {
    return _tmdbApi.getTopRatedTvShows();
  }

  @override
  Future<List<TvModel>> getAiringTodayTvShows() {
    return _tmdbApi.getAiringTodayTvShows();
  }

  @override
  Future<List<TvModel>> getOnTheAirTvShows() {
    return _tmdbApi.getOnTheAirTvShows();
  }

  @override
  Future<TrailerModel> getTrailer(int movieId) {
    return _tmdbApi.getTrailer(movieId);
  }
}


