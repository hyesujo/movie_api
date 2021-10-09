import 'dart:convert';

import 'package:movie_app/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieData {
  Future<List<Movie>> loadMovieData() async {
    List<Movie> data = [];
   var resp = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=b2dff17920f85dd3f13b0568f4a96530'));
    if(resp.statusCode == 200) {
      Map<String, dynamic> body = json.decode(resp.body);
      if (body['results'] != null) {
       List<dynamic> list =  body['results'];
      data = list.map<Movie>((item) => Movie.fromJson(item)).toList();
      print(data);
       return data;
      }
    } 
    return data;
  }
}