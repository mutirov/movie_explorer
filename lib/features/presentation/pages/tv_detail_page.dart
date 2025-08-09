import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/features/domain/entities/tv_entity.dart';
import 'package:movie_explorer/features/domain/repositories/movie_and_tv_repository.dart';
import 'package:movie_explorer/features/presentation/bloc/tv_detail/tv_detail_bloc.dart';
import 'package:movie_explorer/features/presentation/bloc/tv_detail/tv_detail_event.dart';
import 'package:movie_explorer/features/presentation/bloc/tv_detail/tv_detail_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvDetailPage extends StatelessWidget {
  final int tvId;
  final TvEntity tv;
  const TvDetailPage({super.key, required this.tvId, required this.tv});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TvDetailBloc(context.read<MovieAndTvRepository>())
            ..add(FetchTvDetail(tvId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TV Show Details'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<TvDetailBloc, TvDetailState>(
          builder: (context, state) {
            if (state is TvDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TvDetailLoaded) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${tv.backdropPath ?? tv.posterPath}',
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
                            'https://image.tmdb.org/t/p/w500${tv.posterPath}',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 500,
                          ),
                          const SizedBox(height: 16.0),
                          Divider(color: Colors.white70),
                          const SizedBox(height: 16.0),
                          if (state.trailer != null &&
                              state.trailer!.results.isNotEmpty)
                            SizedBox(
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: YoutubePlayer(
                                controller: YoutubePlayerController(
                                  initialVideoId:
                                      state.trailer!.results.first.key,
                                  flags: const YoutubePlayerFlags(
                                    autoPlay: false,
                                    mute: false,
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rating: ${tv.voteAverage?.toStringAsFixed(1)}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Text(
                                'First Aired: ${tv.firstAirDate}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            tv.name,
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
                          const SizedBox(height: 8.0),
                          Text(
                            'Overview: ${tv.overview}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is TvDetailError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
