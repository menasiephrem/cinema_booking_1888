import 'package:cinema_booking_1888/models/movie.dart';
import 'package:cinema_booking_1888/ui/widgets/seat/block.dart';
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
      body: 
      Container(
        height: double.infinity,
        color: Colors.white,
        child: 
          SingleChildScrollView(
                  child: 
            Column(
              children: [
                Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.25),
                              spreadRadius: 2,
                              blurRadius: 100,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
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
                SizedBox(height: 40,),  
                Text(
                  "Hall 1: Block A", //TODO this info should come from the API
                  style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  "Tap on your prefered seat",
                  style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 5,),
                Block()
                // Text("works")    
              ],
            ),     
        )        ,
      )
    );
  }
}
