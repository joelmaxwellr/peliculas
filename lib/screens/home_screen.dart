import 'package:flutter/material.dart';
import 'package:peliculas/models/now_playing_response.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/card_swiper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas en Cines"),
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CardSwiper(movies: movieProvider.onDisplayMovies),
              MovieSlider(
                movies: movieProvider.popularMovies,
                title: "Populares",
                onNextPage: () => movieProvider.getPopularMovies(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
