import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movie.dart';
import 'package:flutter_movie_app/services/web_service.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = List<MovieViewModel>();

  Future <void> fetchMovies (String keyword) async {
    final results = await WebService().fetchMovies(keyword);
    this.movies = results.map((item) => MovieViewModel(movie: item)).toList();
    print(this.movies);
    notifyListeners();
  }
}

class MovieViewModel {
  final Movie movie;

  MovieViewModel({this.movie});

  String get title => this.movie.title;
  String get poster => this.movie.poster;

}