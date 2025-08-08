import 'package:equatable/equatable.dart';
import 'package:movie_explorer/features/domain/entities/movie_entity.dart';

// ignore: must_be_immutable
class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object?> get props => [];
}

class MovieInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<MovieEntity> nowPlayingMovies;
  final List<MovieEntity> popularMovies;
  final List<MovieEntity> topRatedMovies;
  final List<MovieEntity> upcomingMovies;

  const MoviesLoaded({
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcomingMovies,
  });

  @override
  List<Object?> get props => [
    nowPlayingMovies,
    popularMovies,
    topRatedMovies,
    upcomingMovies,
  ];
}

class MoviesError extends MoviesState {
  final String message;

  const MoviesError(this.message);

  @override
  List<Object?> get props => [message];
}
