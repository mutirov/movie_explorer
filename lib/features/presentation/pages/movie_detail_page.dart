import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/features/domain/entities/movie_entity.dart';
import 'package:movie_explorer/features/domain/repositories/movie_and_tv_repository.dart';
import 'package:movie_explorer/features/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie_explorer/features/presentation/bloc/movie_detail/movie_detail_event.dart';
import 'package:movie_explorer/features/presentation/bloc/movie_detail/movie_detail_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailPage extends StatelessWidget {
  final int movieId;

  const MovieDetailPage({
    super.key,
    required this.movieId,
    required MovieEntity movie,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MovieDetailBloc(RepositoryProvider.of<MovieAndTvRepository>(context))
            ..add(FetchMovieDetail(movieId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movie Detail'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieDetailLoaded) {
              final movie = state.movie;
              final trailer = state.trailers;
              String? videoKey;
              if (trailer?.results.isNotEmpty == true) {
                videoKey = trailer!.results.first.key;
              }
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.backdropPath ?? movie.posterPath}',
                      fit: BoxFit.cover,
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.6),
                      colorBlendMode: BlendMode.darken,
                    ),
                  ),
                  SafeArea(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 500,
                          ),
                          const SizedBox(height: 16.0),
                          Divider(color: Colors.white70),
                          const SizedBox(height: 16.0),
                          if (videoKey != null && videoKey.isNotEmpty)
                            SizedBox(
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: YoutubePlayer(
                                controller: YoutubePlayerController(
                                  initialVideoId: videoKey,
                                  flags: const YoutubePlayerFlags(
                                    autoPlay: false,
                                    mute: false,
                                  ),
                                ),
                              ),
                            )
                          else
                            const Text(
                              'Trailer not available',
                              style: TextStyle(color: Colors.white70),
                            ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rating: ${movie.voteAverage ?? 'N/A'}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                'Release Date: ${movie.releaseDate ?? 'N/A'}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 4,
                                  color: Colors.black54,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            movie.overview ?? 'No overview available.',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is MovieDetailError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
