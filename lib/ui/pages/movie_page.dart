import 'package:cinema_booking_1888/models/movie.dart';
import 'package:flutter/material.dart';


class MoviePage extends StatefulWidget {
  MoviePage(this.movie);

  final Movie movie;
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text(this.widget.movie.title),
    );
  }
}