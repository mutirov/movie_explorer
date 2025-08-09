import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/features/domain/entities/movie_entity.dart';
import 'package:movie_explorer/features/domain/repositories/movie_and_tv_repository.dart';
import 'package:movie_explorer/features/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie_explorer/features/presentation/bloc/movie_detail/movie_detail_event.dart';
import 'package:movie_explorer/features/presentation/pages/movie_detail_page.dart';

class PopularMovies extends StatelessWidget {
  final List<MovieEntity> movies;

  const PopularMovies({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Movies',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 12),
        CarouselSlider.builder(
          itemCount: movies.length,
          itemBuilder: (context, index, realIndex) {
            final movie = movies[index];
            final posterPath = movie.posterPath;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) =>
                          MovieDetailBloc(
                            RepositoryProvider.of<MovieAndTvRepository>(
                              context,
                            ),
                          )..add(
                            FetchMovieDetail(movie.id),
                          ), // Önemli: Detay veriyi çağıran event'i ekle
                      child: MovieDetailPage(movieId: movie.id, movie: movie),
                    ),
                  ),
                );
                print('Tapped on ${movie.title}');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 8,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      // Poster image or placeholder
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: posterPath != null && posterPath.isNotEmpty
                            ? Image.network(
                                'https://image.tmdb.org/t/p/w500$posterPath',
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      color: Colors.grey[800],
                                      child: const Icon(
                                        Icons.broken_image,
                                        color: Colors.white,
                                        size: 64,
                                      ),
                                    ),
                              )
                            : Container(
                                color: Colors.grey[800],
                                child: const Icon(
                                  Icons.image_not_supported,
                                  color: Colors.white,
                                  size: 64,
                                ),
                              ),
                      ),
                      // Title background
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          color: Colors.transparent,
                          child: Text(
                            movie.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 300,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.6,
            aspectRatio: 16 / 9,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        ),
      ],
    );
  }
}
