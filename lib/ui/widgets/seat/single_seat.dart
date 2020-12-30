import 'package:flutter/material.dart';


class Seat extends StatelessWidget {
  const Seat(this.booked, this.selected);
  final bool booked;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .77,
      child: Container(
        decoration: BoxDecoration(
        color: selected? Color(0xff2AC7F8): booked? Color(0xff6D6D6D):  null,
        border: Border.all(
          color: selected? Color(0xff2AC7F8): booked? Color(0xff6D6D6D): Color(0xffC4C9DF),
          width: 1, 
        ),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6))
      )
      ),
    );
  }
}