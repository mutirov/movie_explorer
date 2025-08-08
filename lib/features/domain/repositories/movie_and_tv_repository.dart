
import 'package:movie_explorer/features/data/models/movie_model.dart';
import 'package:movie_explorer/features/data/models/trailer_model.dart';
import 'package:movie_explorer/features/data/models/tv_model.dart';

abstract class MovieAndTvRepository {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> getUpcomingMovies();
  Future<TrailerModel> getTrailer(int movieId);

  Future<List<TvModel>> getPopularTvShows();
  Future<List<TvModel>> getTopRatedTvShows();
  Future<List<TvModel>> getAiringTodayTvShows();
  Future<List<TvModel>> getOnTheAirTvShows();
}




