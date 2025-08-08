import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/features/data/data_sources/remote/tmdb_api.dart';
import 'package:movie_explorer/features/data/repositories/movie_and_tv_repository_impl.dart';
import 'package:movie_explorer/features/domain/repositories/movie_and_tv_repository.dart';
import 'package:movie_explorer/features/presentation/bloc/movie/movies_bloc.dart';
import 'package:movie_explorer/features/presentation/bloc/movie/movies_event.dart';
import 'package:movie_explorer/features/presentation/bloc/tv/tv_bloc.dart';
import 'package:movie_explorer/features/presentation/bloc/tv/tv_event.dart';
import 'package:movie_explorer/features/presentation/pages/home_page.dart';

void main() {
  runApp(const MovieExplorer());
}

class MovieExplorer extends StatelessWidget {
  const MovieExplorer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MovieAndTvRepository>(
          create: (_) => MovieAndTvRepositoryImpl(TmdbApi()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MoviesBloc>(
            create: (context) => MoviesBloc(context.read<MovieAndTvRepository>())..add(const FetchAllMovies()),
          ),
          BlocProvider<TvBloc>(
            create: (context) => TvBloc(context.read<MovieAndTvRepository>())..add(FetchAllTv()),
          ),
        ],
        child: MaterialApp(
          title: 'Movie Explorer',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            scaffoldBackgroundColor: const Color(0xFF2C2C2E),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1C1C1E),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
