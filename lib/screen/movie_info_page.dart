import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:movie_app/screen/movie_detail_page.dart';
import 'package:provider/provider.dart';

class MovieInfoPage extends StatelessWidget {
  MovieInfoPage({Key? key}) : super(key: key);
  late MovieProvider _movieProvider;

  @override
  Widget build(BuildContext context) {
    _movieProvider = Provider.of(context, listen: false);
    _movieProvider.loadMovieData();
    return Scaffold(
      body: Consumer<MovieProvider>(builder: (context, movieData, widget) {
        if (movieData.movies.isNotEmpty) {
          return ListView(
            shrinkWrap: true,
            children: [
              _buildBody(movieData.movies, context),
            ],
          );
        } else if (movieData.movies.isEmpty) {
          return Center(child: Text('데이터를 불러올 수 없어요'));
        } else {
          return Center(child: Text('데이터를 불러오는 중입니다.'));
        }
      }),
    );
  }

  Widget _buildBody(List<Movie> movieDatas, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: const Text(
              '현재 상영중',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 200,
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return _buildMainPost(context, movieDatas[index]);
                }),
          ),
          _buildMovieInfo(title: '개봉 예정', movieDatas: movieDatas),
          _buildMovieInfo(title: '인기', movieDatas: movieDatas),
          _buildMovieInfo(title: '높은 평점', movieDatas: movieDatas),
        ],
      ),
    );
  }

  Widget _buildMainPost(BuildContext context, Movie movieData) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MovieDetailPage(
                  movie: movieData,
                )));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 16),
            height: 160,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(movieData.postUrl)),
          ),
          const SizedBox(height: 7),
          Container(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              movieData.title.length > 10
                  ? movieData.title.substring(0, 11) + '...'
                  : movieData.title,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 16),
            child: RatingBar.builder(
                initialRating: 4,
                direction: Axis.horizontal,
                ignoreGestures: true,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: Colors.amber),
                itemSize: 9,
                onRatingUpdate: (_) {}),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieInfo(
      {required List<Movie> movieDatas, required String title}) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Container(
            height: 220,
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return movieItem(movieDatas[index]);
                }),
          )
        ],
      ),
    );
  }

  Widget movieItem(Movie movie) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 60,
                    child: Image.network(movie.postUrl),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  RatingBar.builder(
                      initialRating: 4,
                      direction: Axis.horizontal,
                      ignoreGestures: true,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) =>
                          const Icon(Icons.star, color: Colors.amber),
                      itemSize: 9,
                      onRatingUpdate: (_) {}),
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: const Text(
                      'Action, Drama',
                      style: TextStyle(
                          color: Color.fromRGBO(0x9a, 0x9a, 0x9a, 1),
                          fontSize: 9),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            movie.releaseDate,
            style: TextStyle(
                color: Color.fromRGBO(0x9a, 0x9a, 0x9a, 1), fontSize: 9),
          )
        ],
      ),
    );
  }
}
