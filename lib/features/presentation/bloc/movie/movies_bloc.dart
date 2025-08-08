import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/features/domain/repositories/movie_and_tv_repository.dart';
import 'package:movie_explorer/features/presentation/bloc/movie/movies_event.dart';
import 'package:movie_explorer/features/presentation/bloc/movie/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MovieAndTvRepository repository;

  MoviesBloc(this.repository) : super(MovieInitial()) {
    on<FetchAllMovies>(_onFetchAllMovies);
  }

Future<void> _onFetchAllMovies(
  FetchAllMovies event,
  Emitter<MoviesState> emit,
) async {
  emit(MoviesLoading());

  try {
    final results = await Future.wait([
      repository.getNowPlayingMovies(),
      repository.getPopularMovies(),
      repository.getTopRatedMovies(),
      repository.getUpcomingMovies(),
    ]);

    emit(MoviesLoaded(
      nowPlayingMovies: results[0],
      popularMovies: results[1],
      topRatedMovies: results[2],
      upcomingMovies: results[3],
    ));
  } catch (e) {
    emit(MoviesError(e.toString()));
  }
}

  
}