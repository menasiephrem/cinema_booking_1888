import 'package:cinema_booking_1888/models/movie.dart';
import 'package:cinema_booking_1888/services/movie_services.dart';
import 'package:cinema_booking_1888/ui/widgets/movie_card.dart';
import 'package:flutter/material.dart';

import '../../finder.dart';


class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieServices _movieServices = locator<MovieServices>();
  List<Movie> _movies;

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  _loadMovies() async{
    var movies = await _movieServices.fetchMovies();
    setState(() {
      _movies = movies;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Showing"),
      ),
      body: _movies != null?
        GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.57,
          children: _movies.map<Widget>((e){
            return MovieCard(e); 
          }).toList(),
        ): 
        Center(child: CircularProgressIndicator(),),
    );
  }
}