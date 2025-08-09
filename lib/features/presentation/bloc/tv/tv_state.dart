import 'package:equatable/equatable.dart';
import 'package:movie_explorer/features/domain/entities/tv_entity.dart';

class TvState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TvInitial extends TvState {}

class TvLoading extends TvState {}

class TvLoaded extends TvState {
    final List<TvEntity> popularTv;
  final List<TvEntity> topRatedTv;
  final List<TvEntity> airingTodayTv;
  final List<TvEntity> onTheAirTv;

   TvLoaded({
    required this.popularTv,
    required this.topRatedTv,
    required this.airingTodayTv,
    required this.onTheAirTv,
  });

    @override
  List<Object?> get props => [
    popularTv,
    topRatedTv,
    airingTodayTv,
    onTheAirTv,
  ];
}
class TvError extends TvState {
  final String message;

  TvError(this.message);

  @override
  List<Object?> get props => [message];
}