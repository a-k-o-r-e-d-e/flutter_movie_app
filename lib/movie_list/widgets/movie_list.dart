import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie_list/view_models/movie_view_models.dart';

class MovieList extends StatelessWidget {

  final List<MovieViewModel> movies;

  MovieList({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.movies.length,
        itemBuilder: (context, index) {
          final movie = this.movies[index];

          return ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(movie.poster)
                ),
                borderRadius: BorderRadius.circular(6)
              ),
              width: 50,
              height: 100,
            ),
            title: Text(movie.title),
          );
        });
  }
}
