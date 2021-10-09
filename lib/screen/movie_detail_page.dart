import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatelessWidget {
  Movie movie;
  MovieDetailPage({required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: [
        Container(
          child: Image.network(
            movie.postUrl,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: screenHeight * 0.3),
          width: MediaQuery.of(context).size.width,
          child: Material(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            child: Stack(
                overflow: Overflow.visible,
                fit: StackFit.loose,
                children: [
                  Positioned(
                    top: -50,
                    left: 16,
                    child: SizedBox(
                      width: 100,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(movie.postUrl),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 104, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 5,
                          ),
                          child: Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        )
      ],
    );
  }
}
