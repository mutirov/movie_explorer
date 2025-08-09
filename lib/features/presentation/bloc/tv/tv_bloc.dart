import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/features/domain/repositories/movie_and_tv_repository.dart';
import 'package:movie_explorer/features/presentation/bloc/tv/tv_event.dart';
import 'package:movie_explorer/features/presentation/bloc/tv/tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
final MovieAndTvRepository _repository;


TvBloc(this._repository) : super(TvInitial()) {
  on<FetchAllTv>(_onFetchAllTvShows);
}

Future<void> _onFetchAllTvShows(
  FetchAllTv event,
  Emitter<TvState> emit,
) async {
  emit(TvLoading());

  try {
    final results = await Future.wait([
      _repository.getPopularTvShows(),
      _repository.getTopRatedTvShows(),
      _repository.getAiringTodayTvShows(),
      _repository.getOnTheAirTvShows(),
    ]);

    emit(TvLoaded(
      popularTv: results[0],
      topRatedTv: results[1],
      airingTodayTv: results[2],
      onTheAirTv: results[3],
    ));
  } catch (e) {
    emit(TvError(e.toString()));
  }
}
}