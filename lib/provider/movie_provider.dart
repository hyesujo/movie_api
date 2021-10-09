import 'package:flutter/material.dart';
import 'package:movie_app/data/movie_data.dart';
import 'package:movie_app/model/movie.dart';

class MovieProvider extends ChangeNotifier {
  final MovieData _movieData = MovieData();
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;
  loadMovieData() async {
   List<Movie> movieList = await _movieData.loadMovieData();
   _movies = movieList;
   notifyListeners();
  } 
}