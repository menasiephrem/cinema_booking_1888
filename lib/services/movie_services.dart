import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cinema_booking_1888/models/movie.dart';
import 'package:xml/xml.dart';

class MovieServices {
  Future<List<Movie>> fetchMovies() async {
    final response = await http.get('https://imdb-best-winners.herokuapp.com/');
    if (response.statusCode == 200) {
      List<dynamic> _movies = jsonDecode(response.body);
      return _movies.map((movieData) => Movie.fromJson(movieData, _movies.indexOf(movieData))).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<String>> getMovieShowTime(BuildContext context, int id) async {
    final value = await DefaultAssetBundle.of(context)
        .loadString("data/show_time.xml");
    List<String> showTimes = [];
    
    final document = XmlDocument.parse(value);
    final movies = document.findAllElements('Movie');
    final currentMovie = movies.firstWhere((node) => node.getElement("id").text == '$id');

    currentMovie
      .getElement('showtime')
      .findAllElements("time")
      .map((node) => node.text)
      .forEach((time) { 
          showTimes.add(time);
      });

    return showTimes;
  }
}