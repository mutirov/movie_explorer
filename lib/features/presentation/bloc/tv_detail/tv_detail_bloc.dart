import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/features/domain/repositories/movie_and_tv_repository.dart';
import 'package:movie_explorer/features/presentation/bloc/tv_detail/tv_detail_event.dart';
import 'package:movie_explorer/features/presentation/bloc/tv_detail/tv_detail_state.dart';

class TvDetailBloc extends Bloc<TvDetailEvent, TvDetailState> {
  final MovieAndTvRepository repository;

  TvDetailBloc(this.repository) : super(TvDetailInitial()) {
    on<FetchTvDetail>(_onFetchTvDetail);
  }

  Future<void> _onFetchTvDetail(
    FetchTvDetail event,
    Emitter<TvDetailState> emit,
  ) async {
    emit(TvDetailLoading());
    try {
      final tv = await repository.getTvDetail(event.tvId);
      final trailer = await repository.getTvTrailer(event.tvId);
      emit(TvDetailLoaded(tv, trailer));
    } catch (e, stack) {
      print(stack); // debug için
      emit(TvDetailError(e.toString()));
    }
  }
}

