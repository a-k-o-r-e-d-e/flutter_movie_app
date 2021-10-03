import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie_list/view_models/movie_view_models.dart';
import 'package:flutter_movie_app/movie_list/widgets/movie_list.dart';
import 'package:flutter_movie_app/utils.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // get all batman movies when this page is loaded
    // Provider.of<MovieListViewModel>(context, listen: false)
    //     .fetchMovies('batman');
  }

  @override
  Widget build(BuildContext context) {
    // final vm = Provider.of<MovieListViewModel>(context);

    return ChangeNotifierProvider<MovieListViewModel>(
        create: (_) => MovieListViewModel(),
        child: Scaffold(
          appBar: AppBar(),
          drawer: buildDrawer(context),
          body: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        Provider.of<MovieListViewModel>(context)
                            .fetchMovies(keyword: value);
                        _controller.clear();
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none),
                  ),
                ),
                Expanded(
                  child: Consumer<MovieListViewModel>(
                    builder: (BuildContext context, model, Widget child) =>
                        MovieList(
                      movies: model.movies,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
