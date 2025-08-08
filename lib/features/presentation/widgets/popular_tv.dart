import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_explorer/features/domain/entities/tv_entity.dart';

class PopularTv extends StatelessWidget {
  final  List<TvEntity> tvShows;
  const PopularTv({super.key, required this.tvShows});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular TV Shows',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),SizedBox(height: 10),
        SizedBox(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider.builder(
            itemCount: tvShows.length,
            itemBuilder: (context, index, realIndex) {
              final show = tvShows[index];
              return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => TvDetailPage(tvSeries: show),
                    //   ),
                    // );
                    print('Tapped on ${show.name}');
                  },
                  child: Container(
                    width: 150,
                    margin: EdgeInsets.zero,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${show.posterPath}',
                            fit: BoxFit.cover,
                            height: 200,
                            width: 150,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          show.name,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
            }, options: CarouselOptions(
          height: 300,
          autoPlay: true,
          enlargeCenterPage: false,
          viewportFraction: 0.5,
          aspectRatio: 16 / 9,
          initialPage: 0,
          enableInfiniteScroll: true,
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
          ),
        ),
      ],
    );
  }
}