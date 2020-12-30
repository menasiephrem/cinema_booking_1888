import 'package:cinema_booking_1888/models/movie.dart';
import 'package:cinema_booking_1888/models/ticket.dart';
import 'package:cinema_booking_1888/ui/pages/ticket_page.dart';
import 'package:cinema_booking_1888/ui/widgets/seat/block.dart';
import 'package:cinema_booking_1888/ui/widgets/seat/single_seat.dart';
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


  int _totalTickets = 0;
  int _price = 50;
  List<String> _seats = [];


  _ticketCounter(List<String> tickets){
    setState(() {
      _totalTickets = tickets.length;
      _seats = tickets;
    });
  }

  _goToTicketPage(){
    Ticket ticket = Ticket(this.widget.movie, _seats, this.widget.time, _totalTickets * _price);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TicketPage(ticket),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seat Selector"),
      ),
      body: 
      SingleChildScrollView(
        child: 
           Column(
             children: [
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
                  "Hall 1: Block A", //this info should come from the API
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
                Block(_ticketCounter),
                SizedBox(height: 15,), 
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  width: double.infinity,
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 24,
                        child:Seat(false, false,)
                      ),
                      SizedBox(width: 2,),
                      Text(
                        "Available",
                        style: TextStyle(
                          fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 24,
                        child:Seat(true, false,)
                      ),
                      SizedBox(width: 2,),
                      Text(
                        "Booked",
                        style: TextStyle(
                          fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(width: 8,),
                      Container(
                        width: 24,
                        child:Seat(false, true,)
                      ),
                      SizedBox(width: 2,),
                      Text(
                        "Your Selection",
                        style: TextStyle(
                          fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15,), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 24,
                        height: 20,
                        child:Seat(false, false,)
                      ),
                    SizedBox(width: 2,),
                    Text(
                      "Not-Available on Meda",
                      style: TextStyle(
                        fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50,),  
                Container(
                  width: double.infinity,
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffF0F0F1),
                      width: 2, 
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 8,),
                      Container(
                        child: 
                          Text(
                            "TICKET\nQTY",
                            style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500, 
                            ), textAlign: TextAlign.right,
                          ),
                      ),
                      SizedBox(width: 8,),
                      Text(
                        "$_totalTickets",
                        style: TextStyle(
                          fontSize: 26, fontWeight: FontWeight.w500, 
                        ),
                      ),
                      SizedBox(width: 5,),
                      Icon(Icons.keyboard_arrow_down, size: 40,),
                      SizedBox(width: 8,),
                      Container(
                        width: 1,
                        height: 30,
                        color:  Color(0xffC4C9DF)
                      ),
                      SizedBox(width: 8,),
                      Text(
                        "TOTAL\nPAYABLE",
                        style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500, 
                        ), textAlign: TextAlign.right,
                      ),
                      SizedBox(width: 8,),
                      Flexible(
                        child:
                        Text(
                          "${_totalTickets * _price}Br",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w500, 
                          ),
                        )
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50,), 
              ],
            ),
            InkWell(
              onTap:_goToTicketPage,
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
                            "Continue to ticket page",
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
        )        ,
    );
  }
}
