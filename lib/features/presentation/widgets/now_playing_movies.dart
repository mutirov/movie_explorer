import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/features/domain/entities/movie_entity.dart';
import 'package:movie_explorer/features/domain/repositories/movie_and_tv_repository.dart';
import 'package:movie_explorer/features/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie_explorer/features/presentation/bloc/movie_detail/movie_detail_event.dart';
import 'package:movie_explorer/features/presentation/pages/movie_detail_page.dart';

class NowPlayingMovies extends StatelessWidget {
  final List<MovieEntity> movies;
  const NowPlayingMovies({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Now Playing Movies',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => MovieDetailBloc(
                          RepositoryProvider.of<MovieAndTvRepository>(context),
                        )..add(FetchMovieDetail(movie.id)),
                        child: MovieDetailPage(movieId: movie.id, movie: movie),
                      ),
                    ),
                  );
                  print('Tapped on ${movie.title}');
                },
                child: Container(
                  width: 150,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                          fit: BoxFit.cover,
                          height: 200,
                          width: 150,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        movie.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
