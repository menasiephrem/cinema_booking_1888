import 'package:cinema_booking_1888/models/seating_block.dart';
import 'package:cinema_booking_1888/services/seat_services.dart';
import 'package:cinema_booking_1888/ui/widgets/seat/single_seat.dart';
import 'package:flutter/material.dart';

import '../../../finder.dart';

class Block extends StatefulWidget {
  Block(this.ticketCounter);

  final Function ticketCounter;
  @override
  _BlockState createState() => _BlockState();
}

class _BlockState extends State<Block> {
  SeatService _seatService = locator<SeatService>();

  SeatingBlock _booking;
  List<String> _selected = [];

  @override
  void initState() {
    super.initState();
    _loadSeatingBlock();
  }

  _loadSeatingBlock() async {
    SeatingBlock booking = await _seatService.getSeatingBlock(context);
    setState(() {
      _booking = booking;
    });
  }

  final lableStyle = TextStyle(color: Color(0xff939393), fontWeight: FontWeight.w400, fontSize: 11);

  _toggleSelected(String seat){
    if(_booking.bookedSeats.indexOf(seat) > -1) return;
    if(_selected.indexOf(seat) > -1){
       _selected.remove(seat);
    }else {
      _selected.add(seat);
    }
    setState(() {
      _selected = _selected;
    });
    this.widget.ticketCounter(_selected);
  }

  @override
  Widget build(BuildContext context) {
    return 
    _booking != null?
    Container(
       width: MediaQuery.of(context).size.width - 20,
       padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
       height: 17 * _booking.row * 1.0,
       constraints: BoxConstraints(minHeight: 28 * _booking.row * 1.0, maxWidth: double.infinity),
       child: 
       GridView.count(
          crossAxisCount: _booking.column,
          childAspectRatio: 1.19,
          children: _booking.seats.map<Widget>((e){
            return Padding(
              padding: EdgeInsets.all(5),
              child: 
                e.startsWith("i")?
                Center(child: Text(e.split("_")[1], textAlign: TextAlign.center, style: lableStyle)):
                e.startsWith("j")?
                Text(e.split("_",)[1], textAlign: TextAlign.center, style: lableStyle,):
                e.startsWith("e")?
                Text(""):
                InkWell(
                  onTap: (){
                    _toggleSelected(e);
                  },
                  child:
                    Seat(_booking.bookedSeats.indexOf(e) > -1, _selected.indexOf(e) > -1)
                ),
            ); 
          }).toList(),
        ),
    ): Text("");
  }

}