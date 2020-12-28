import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Time extends StatelessWidget {
  const Time(this.time, this.selected, this.available);
  final DateTime time;
  final bool selected;
  final bool available;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 10,
      height: 35,
      decoration: BoxDecoration(
        color: selected? Color(0xff2AC7F8): null,
        border: Border.all(
          color: selected? Color(0xff2AC7F8):  Color(0xffC4C9DF),
          width: 2, 
        ),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Container(
        height: 35,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 21),
        child: Text(
          "${DateFormat('jm').format(time).toString().toUpperCase()} (${available? "Available": "Not-Available"})",
          style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w600, color: selected? Colors.white: Color(0xff5E636A)
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}