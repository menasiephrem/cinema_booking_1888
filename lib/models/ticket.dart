import 'package:uuid/uuid.dart';

import 'movie.dart';

class Ticket{
  List<String> seats;
  String id;
  int price;
  Movie movie;
  DateTime showTime;

var uuid = Uuid();
  Ticket(Movie movie, List<String> seats, DateTime showtime, int price){
    this.movie = movie;
    this.id = uuid.v1();
    this.price = price;
    this.showTime = showtime;
    this.seats = seats;
  }

  Map<String, dynamic> _toJson() => {
    "id": id,
    "seats": this.seats.length,
    "price": this.price,
    "showTime": this.showTime,
    "Movie": this.movie.title,
  };

  @override
  String toString() {
    return _toJson().toString();
  }
  
}