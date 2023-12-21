import 'package:flutter/material.dart';
import '../movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie selectedMovie;
  const MovieDetail({Key? key, required this.selectedMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path;
    double screenHeight =
        MediaQuery.of(context).size.height; //ambil tinggi layar

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
        body: SingleChildScrollView(
            //menambahkan fitur scroll
            child: Center(
                //menempatkan widget di tengah
                child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16), //menambahkan padding
              height: screenHeight / 1.5,
              child: Image.network(path),
            ),
            Text('${selectedMovie.overview}'),
          ],
        ))));
  }
}
