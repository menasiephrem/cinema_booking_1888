import 'package:cinema_booking_1888/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SeatBooking extends StatefulWidget {
  SeatBooking(this.movie, this.time);
  final Movie movie;
  final DateTime time;
  @override
  _SeatBookingState createState() => _SeatBookingState();
}

class _SeatBookingState extends State<SeatBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seat Selector"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        height: 140,
        child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Text(
                this.widget.movie.title,
                style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Schedule Selected",
                style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff868E96)
                ),
              ),
              SizedBox(height: 5,),
              Text(
                DateFormat('E, d | hh:m a').format(this.widget.time).toString().toUpperCase(),
                style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w500
                ),
              ),                          
            ],
          ),
      ),
    );
  }
}