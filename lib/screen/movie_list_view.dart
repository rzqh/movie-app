import 'package:flutter/material.dart';

import '../komponen/http_helper.dart';
import 'movie_detail.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  late int moviesCount;
  late List movies;
  late HttpHelper helper;

  //tambahan iconbase
  final String iconBase = 'https://image.tmdb.org/t/p/w92/';
  final String defaultImage =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clap board1184339.jpg';

  @override
  void initState() {
    defaultList();
    super.initState();
  }

  Future defaultList() async {
    moviesCount = 0;
    movies = [];
    helper = HttpHelper();
    List moviesFromAPI = [];
    moviesFromAPI = await helper.getUpComingAsList();
    setState(() {
      movies = moviesFromAPI;
      moviesCount = movies.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    NetworkImage image;
    return Scaffold(
        appBar: AppBar(
          title: Text('Daftar Film'),
        ),
        body: ListView.builder(
            itemCount: moviesCount,
            itemBuilder: (context, position) {
              if (movies[position].posterPath != null) {
                image = NetworkImage(iconBase + movies[position].posterPath);
              } else {
                image = NetworkImage(defaultImage);
              }
              return Card(
                  elevation: 2,
                  child: ListTile(
                      onTap: () {
                        MaterialPageRoute route =
                            MaterialPageRoute(builder: (context) {
                          return MovieDetail();
                        });
                        Navigator.push(context, route);
                      },
                      title: Text(movies[position].title),
                      subtitle: Text(
                        'Released: ' +
                            movies[position].releaseDate +
                            ' - vote: ' +
                            movies[position].voteAverage.toString(),
                      )));
            }));
  }
}
