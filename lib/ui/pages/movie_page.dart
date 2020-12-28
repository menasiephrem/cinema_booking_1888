import 'package:cinema_booking_1888/models/movie.dart';
import 'package:cinema_booking_1888/services/movie_services.dart';
import 'package:cinema_booking_1888/ui/pages/seat_selector.dart';
import 'package:cinema_booking_1888/ui/widgets/days_of_week.dart';
import 'package:cinema_booking_1888/ui/widgets/movie_genre_bubles.dart';
import 'package:cinema_booking_1888/ui/widgets/times_of_day.dart';
import 'package:flutter/material.dart';

import '../../finder.dart';


class MoviePage extends StatefulWidget {
  MoviePage(this.movie);

  final Movie movie;
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  MovieServices _movieServices = locator<MovieServices>();
  DateTime _selectedTime = DateTime.now();
  List<String> _showTimes = [];
  String _timeSelected;

  @override
  void initState() {
    super.initState();
    _loadShowTime();
  }

  _loadShowTime() async {
    final showTimes = await _movieServices.getMovieShowTime(context, this.widget.movie.id);
    setState(() {
      _showTimes = showTimes;
      _timeSelected = showTimes.isNotEmpty? showTimes.first : "";
    });
  }

  _onSelectedTimeChange(DateTime time){
    setState(() {
      _selectedTime = time;
    });
  }

  _onTimeChange(String time){
    setState(() {
      _timeSelected = time;
    });
  }

  _goToSeatSelector(){
    final time =  DateTime(_selectedTime.year, _selectedTime.month, _selectedTime.day, int.parse(_timeSelected.split(":")[0]), int.parse(_timeSelected.split(":")[1]));
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SeatBooking(this.widget.movie, time),
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    final movie = this.widget.movie;
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Showing"),
      ),
      body: 
      SingleChildScrollView(
        child: 
          Column(
           children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(movie.poster, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star_border, color: Colors.grey),
                            SizedBox(width: 3),
                            Text(
                              movie.imdbRating,
                              style: TextStyle(
                                fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold,
                              )
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.watch, color: Colors.grey),
                            SizedBox(width: 3),
                            Text(
                              movie.runtime,
                              style: TextStyle(
                                fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold
                              )
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.movie_creation, color: Colors.grey),
                            SizedBox(width: 3),
                            Text(
                              "3D",
                              style: TextStyle(
                                fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold
                              )
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Divider(color: Colors.grey),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Synopsis",
                        style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500
                        ),
                      ),
                      MovieGenres(movie.genre)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(  
                    height: 100,        
                    child: Text(
                      movie.plot,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Container(         
                    width: MediaQuery.of(context).size.width, 
                    child: Text(
                      "Date",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  DaysOfWeek(_selectedTime, _onSelectedTimeChange),
                  SizedBox(height: 10,),
                  Container(         
                    width: MediaQuery.of(context).size.width, 
                    child: Text(
                      "Time",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TimesOfDay(_showTimes, _timeSelected, _onTimeChange),
                  SizedBox(height: 10,),
                ],
              ),
            ),
            InkWell(
              onTap: _goToSeatSelector,
              child:
                Container(         
                  width: MediaQuery.of(context).size.width, 
                  height: 57,
                  color: Color(0xff2AC7F8),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            "Continue to seat selector",
                            style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white
                            ),
                            textAlign: TextAlign.start,
                        ),
                        Icon(Icons.arrow_forward_outlined, color: Colors.white, size: 30,)
                      ],
                    ),
                )              
            )
          ],
        )
      ),
    );
  }
}