import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:moviedb/movie.dart';

class HttpHelper{
  // Kelas ini digunakan untuk mendapatkan data dari themoviedb
  // dengan metode upcoming yang memberikan nilai return berupa teks

  final String urlKey = 'api_key=b4453800f79df848b182b0c0f742a8d2';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&langage=en-US';

  Future<String> getUpcoming() async{
    final Uri upcoming = Uri.parse(urlBase + urlUpcoming + urlKey + urlLanguage);
    http.Response result = await http.get(upcoming);
    if(result.statusCode == HttpStatus.ok){
      String responseBody = result.body;
      return responseBody;
    }
    else {
      return '{}';
    }
  }

  Future<List> getUpComingAsList() async {
    final Uri upcoming =
      Uri.parse(urlBase + urlUpcoming + urlKey + urlLanguage);
    http.Response result = await http.get(upcoming);
    if (result.statusCode == HttpStatus.ok){
      final jsonResponseBody = json.decode(result.body);
      final movieObjects = jsonResponseBody['results'];
      List movies = movieObjects.map((json) => Movie.fromJson(json)).toList();

      return movies;
    } else{
      return [];
    }
  }
}