import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/model/actor.dart';
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
        primary: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.zero, child: _buildBody(context)),
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
                    top: -40,
                    left: 16,
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      width: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(movie.postUrl)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 125, top: 10),
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 125, top: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: movie.adult == true
                                  ? Colors.red
                                  : Colors.green),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          child: Text(
                            movie.adult == true ? 'adult' : 'child',
                            style: TextStyle(
                                color: movie.adult == true
                                    ? Colors.red
                                    : Colors.green),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 125, top: 5),
                        child: const Text(
                          '드라마,sf',
                          style: TextStyle(
                              color: Color.fromRGBO(0xd9, 0xd9, 0xd9, 1),
                              fontSize: 11),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 125, top: 5),
                        child: Text(
                          '${movie.releaseDate} 발매',
                          style: const TextStyle(
                              color: Color.fromRGBO(0xd9, 0xd9, 0xd9, 1),
                              fontSize: 11),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 125, top: 5),
                        child: Row(
                          children: [
                            RatingBar.builder(
                                initialRating: 5,
                                direction: Axis.horizontal,
                                ignoreGestures: true,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemBuilder: (context, _) =>
                                    const Icon(Icons.star, color: Colors.amber),
                                itemSize: 12,
                                onRatingUpdate: (_) {}),
                            Text(
                              '${movie.voteAverage.toString()}',
                              style: const TextStyle(
                                  color: Colors.amber, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 24, left: 16),
                        child: const Text(
                          '개요',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        child: Text(
                          '${movie.overView}',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(0x82, 0x82, 0x82, 1)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 24, left: 16),
                        child: const Text(
                          '주요 출연진',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 15, left: 16),
                        child: _buildActor(),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 24, left: 16),
                        child: const Text(
                          '리뷰',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildReview(),
                      _buildReview(),
                      _buildReview(),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ]),
          ),
        )
      ],
    );
  }

  Container _buildReview() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.only(top: 15, left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 40,
            child: Text(
              "As I'm writing this review, Darth Vader's theme music begins to build in my mind...",
              style: TextStyle(
                  color: Color.fromRGBO(0x61, 0x61, 0x61, 1), fontSize: 12),
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Cat Ellington',
            style: TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(0xa1, 0xa1, 0xa1, 1),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildActor() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        ...List.generate(
          actors.length,
          (i) => Padding(
            padding: const EdgeInsets.only(left: 20),
            child: _buildActorItem(
              actor: actors[i],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildActorItem({required Actor actor}) {
    return Column(children: [
      ClipOval(
        child: Image.asset(
          actor.image,
          fit: BoxFit.cover,
          height: 45,
          width: 45,
        ),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        actor.name,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
      ),
    ]);
  }
}
