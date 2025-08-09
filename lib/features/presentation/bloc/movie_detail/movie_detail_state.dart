import 'package:equatable/equatable.dart';
import 'package:movie_explorer/features/domain/entities/movie_entity.dart';
import 'package:movie_explorer/features/domain/entities/trailer_entity.dart';

class MovieDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieEntity movie;
  final TrailerEntity? trailers;

  MovieDetailLoaded(this.movie, this.trailers);

  @override
  List<Object?> get props => [movie, trailers];
}

class MovieDetailError extends MovieDetailState {
  final String message;

  MovieDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
