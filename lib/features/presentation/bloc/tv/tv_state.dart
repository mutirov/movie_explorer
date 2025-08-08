import 'package:equatable/equatable.dart';
import 'package:movie_explorer/features/domain/entities/tv_entity.dart';

class TvState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TvInitial extends TvState {}

class TvLoading extends TvState {}

class TvLoaded extends TvState {
  final List<TvEntity> nowPlayingTv;
  final List<TvEntity> popularTv;
  final List<TvEntity> topRatedTv;
  final List<TvEntity> upcomingTv;

   TvLoaded({
    required this.nowPlayingTv,
    required this.popularTv,
    required this.topRatedTv,
    required this.upcomingTv,
  });

    @override
  List<Object?> get props => [
    nowPlayingTv,
    popularTv,
    topRatedTv,
    upcomingTv,
  ];
}
class TvError extends TvState {
  final String message;

  TvError(this.message);

  @override
  List<Object?> get props => [message];
}