import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class Day extends StatelessWidget {
  const Day(this.day, this.selected);
  final DateTime day;
  final bool selected;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 63,
      height: 73,
      decoration: BoxDecoration(
        border: Border.all(
          color: selected? Color(0xff2AC7F8):  Color(0xffD1D6D8),
          width: 2, 
        ),
        borderRadius: BorderRadius.all(Radius.circular(9))
      ),
      child: Column(
        children: [
          Container(
            height: 21,
            width: 63,
            color: selected? Color(0xff2AC7F8):  Color(0xffD1D6D8),
            child: Text(
              DateFormat('EEE').format(day).toString().toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white
              ),
            ),
          ),
          Container(
            child: Text(
              DateFormat('dd').format(day).toString().toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.w700, color: selected? Colors.black:  Color(0xffD1D6D8)
              ),
            ),
          ),

          Container(
            child: Text(
              DateFormat('MMM').format(day).toString().toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w600, color: selected? Color(0xff5C5C5C):  Color(0xffD1D6D8)
              ),
            ),
          ),
        ],
      ),
    );
  }
}