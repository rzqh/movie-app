import 'package:flutter/material.dart';
import '../movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie selectedMovie;
  const MovieDetail({Key? key, required this.selectedMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Judul Movie'),
      ),
      body: Text('movie detail, kita akan ubah pada langkah 9.3'),
    );
  }
}
