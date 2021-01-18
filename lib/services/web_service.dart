import 'dart:convert';

import 'package:flutter_movie_app/models/movie.dart';
import 'package:flutter_movie_app/secrets.dart';
import 'package:http/http.dart' as http;

class WebService {

  Future<List<Movie>> fetchMovies(String keyword) async {
    final url = 'http://www.omdbapi.com/?t=$keyword&s=$keyword&apikey=$apiKey';
    print(url);
    final response = await http.get(url);
    print("StatusCode: ${response.statusCode}");
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body['Search'];
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
