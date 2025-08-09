import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/features/domain/repositories/movie_and_tv_repository.dart';
import 'package:movie_explorer/features/presentation/bloc/movie_detail/movie_detail_event.dart';
import 'package:movie_explorer/features/presentation/bloc/movie_detail/movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieAndTvRepository _repository;
  

  MovieDetailBloc(this._repository) : super(MovieDetailInitial()) {
    on<FetchMovieDetail>((event, emit) async {
      emit(MovieDetailLoading());
      try {
        final movie = await _repository.getMovieDetail(event.movieId);
        final trailer = await _repository.getTrailer(event.movieId);
        emit(MovieDetailLoaded(movie, trailer));
      } catch (e) {
        emit(MovieDetailError(e.toString()));
      }
    });
  }
}

