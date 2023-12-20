import 'package:flutter/material.dart';
import '../movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie selectedMovie;
  const MovieDetail({Key? key, required this.selectedMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path;
    if (selectedMovie.posterPath != null) {
      path = 'https://image.tmdb.org/t/p/w500/${selectedMovie.posterPath}';
    } else {
      path =
          'https://image.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMovie.title}'),
        ),
        body: Column(
          children: <Widget>[
            Image.network(path),
            Text('${selectedMovie.overview}'),
          ],
        ));
  }
}
