import 'dart:typed_data';

import 'package:cinema_booking_1888/models/ticket.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;


class TicketPage extends StatefulWidget {
  TicketPage(this.ticket);

  final Ticket ticket;
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  GlobalKey globalKey = GlobalKey();


  Future<void> _capturePng() async {
    RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    await Share.file('Send/Save Ticket', '${this.widget.ticket.movie.title}.png', pngBytes, 'image/png');
  }


  @override
  Widget build(BuildContext context) {
     return 
     Scaffold(
      appBar: AppBar(
        title: Text("Ticket"),
      ),
      body: 
        Container(
        color: Colors.white,
        height: double.maxFinite,
        child: Stack(
          //alignment:new Alignment(x, y)
          children: <Widget>[
            Positioned(
              child: RepaintBoundary(
                key: globalKey,
              child:
               SingleChildScrollView(
                child: 
                  Column(
                    children: [
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 25,),
                              Text(
                                "Cinema Ticket",
                                style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700
                                )
                              ),
                              SizedBox(height: 7,),
                               Container(
                                height: 1,
                                width: 129,
                                color:  Color(0xff979797),
                              ),
                              SizedBox(height: 15,),
                              Text(
                                "${this.widget.ticket.movie.title}",
                                style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700
                                )
                              ),
                              SizedBox(height: 15,),
                              QrImage(
                                data: "${this.widget.ticket.toString()}",
                                version: QrVersions.auto,
                                size: 250,
                              ),
                              SizedBox(height: 15,),
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width - 60,
                                color:  Color(0xffD3D3D3),
                              ),
                              SizedBox(height: 15,),
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                height: 143,
                                child: 
                                  Column(
                                    children: [
                                      SizedBox(height: 21,),
                                      Padding(
                                        padding: EdgeInsets.only(right: 50),
                                        child:
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Date",
                                                    style: TextStyle(
                                                      fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff2AC7F8),
                                                    ),
                                                  ),
                                                  SizedBox(height: 4,),
                                                  Text(
                                                    DateFormat('EEEE, d y').format(this.widget.ticket.showTime).toString(),
                                                    style: TextStyle(
                                                      fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(width: 31,),
                                               Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Time",
                                                    style: TextStyle(
                                                      fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff2AC7F8),
                                                    ),
                                                  ),
                                                  SizedBox(height: 4,),
                                                  Text(
                                                    DateFormat('hh:m a').format(this.widget.ticket.showTime).toString(),
                                                    style: TextStyle(
                                                      fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                      ),
                                      SizedBox(height: 21,),
                                      Padding(
                                        padding: EdgeInsets.only(right: 45),
                                        child:
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Cinema Hall",
                                                    style: TextStyle(
                                                      fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff2AC7F8),
                                                    ),
                                                  ),
                                                  SizedBox(height: 4,),
                                                  Text(
                                                    "A",
                                                    style: TextStyle(
                                                      fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(width: 31,),
                                               Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Seat",
                                                    style: TextStyle(
                                                      fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff2AC7F8),
                                                    ),
                                                  ),
                                                  SizedBox(height: 4,),
                                                  Padding(
                                                    padding: EdgeInsets.only(right: 53),
                                                    child: 
                                                    Text(
                                                      "${this.widget.ticket.seats.first}",
                                                      style: TextStyle(
                                                        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black,
                                                      ),
                                                  )
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                      ),                                       
                                    ],
                                  ),
                              ),
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width - 60,
                                color:  Color(0xffD3D3D3),
                              ),
                              SizedBox(height: 21,),
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: 
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Notice", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                                      Text("1. Keep this receipt safe and private"),
                                      Text("2. Do not share or duplicate this recipt."),
                                      Text("3. The above Code is valid for only one use")
                                    ],
                                  ),

                              ),
                              SizedBox(height: 60,),
                            ],
                          ),
                      )
                    ]
                )
              )
             )
            ),
             Positioned(
              child: new Align(
                alignment: FractionalOffset.bottomCenter,
                child:
                 InkWell(
                  onTap: _capturePng,
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
                                "Save as image",
                                style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white
                                ),
                                textAlign: TextAlign.start,
                            )
                          ],
                        ),
                    )              
                ) 
              ),
            )
          ],
        ),
      ),

    );
  }
}

