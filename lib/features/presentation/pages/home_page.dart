import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/core/tools/custom_colors.dart';
import 'package:movie_explorer/features/presentation/bloc/movie/movies_bloc.dart';
import 'package:movie_explorer/features/presentation/bloc/movie/movies_state.dart';
import 'package:movie_explorer/features/presentation/bloc/tv/tv_bloc.dart';
import 'package:movie_explorer/features/presentation/bloc/tv/tv_state.dart';
import 'package:movie_explorer/features/presentation/widgets/airing_today_tv.dart';
import 'package:movie_explorer/features/presentation/widgets/now_playing_movies.dart';
import 'package:movie_explorer/features/presentation/widgets/on_the_air.dart';
import 'package:movie_explorer/features/presentation/widgets/popular_movies.dart';
import 'package:movie_explorer/features/presentation/widgets/popular_tv.dart';
import 'package:movie_explorer/features/presentation/widgets/top_rated_movies.dart';
import 'package:movie_explorer/features/presentation/widgets/top_rated_tv.dart';
import 'package:movie_explorer/features/presentation/widgets/upcoming_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title:  Image.asset('assets/images/logo.jpg', height: 45, fit: BoxFit.cover,),
        backgroundColor: CustomColors.appBarColor, // Custom app bar color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                if (state is MovieInitial) {
                  return const SizedBox();
                } else if (state is MoviesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MoviesLoaded) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          PopularMovies(movies: state.popularMovies),
                          SizedBox(height: 20),
                          Divider(color: Colors.white30, thickness: 1),
                          SizedBox(height: 20),
                          NowPlayingMovies(movies: state.nowPlayingMovies),
                          SizedBox(height: 20),
                          TopRatedMovies(movies: state.topRatedMovies),
                          SizedBox(height: 20),
                          UpcomingMovies(movies: state.upcomingMovies),
                        ],
                      ),
                    ),
                  );
                } else if (state is MoviesError) {
                  return Center(child: Text('Hata: ${state.message}'));
                } else {
                  return const SizedBox();
                }
              },
            ),
            BlocBuilder<TvBloc, TvState>(
              builder: (context, state) {
                if (state is TvInitial) {
                  return const SizedBox();
                } else if (state is TvLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TvLoaded) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Divider(color: Colors.white30, thickness: 1),
                          SizedBox(height: 20),
                          PopularTv(tvShows: state.popularTv),
                          SizedBox(height: 20),
                          TopRatedTv(tvShows: state.topRatedTv),
                          SizedBox(height: 20),
                          AiringTodayTv(tvShows: state.airingTodayTv),
                          SizedBox(height: 20),
                          OnTheAirTv(tvShows: state.onTheAirTv),
                        ],
                      ),
                    ),
                  );
                } else if (state is TvError) {
                  return Center(child: Text('Hata: ${state.message}'));
                } else {
                  return const SizedBox();
                }
              },
              )
          ],
        ),
      ),
    );
  }
}
