import 'package:equatable/equatable.dart';
import 'package:movie_explorer/features/domain/entities/trailer_entity.dart';
import 'package:movie_explorer/features/domain/entities/tv_entity.dart';

class TvDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TvDetailInitial extends TvDetailState {}

class TvDetailLoading extends TvDetailState {}

class TvDetailLoaded extends TvDetailState {
  final TvEntity tv;
  final TrailerEntity? trailer;

  TvDetailLoaded(this.tv, this.trailer);

  @override
  List<Object?> get props => [tv, trailer];
}

class TvDetailError extends TvDetailState {
  final String message;

  TvDetailError(this.message);

  @override
  List<Object?> get props => [message];
}