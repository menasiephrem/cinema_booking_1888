import 'package:cinema_booking_1888/ui/widgets/time_widget.dart';
import 'package:flutter/material.dart';

class TimesOfDay extends StatefulWidget {
  TimesOfDay(this.availableTimes, this.selected, this.onTimeSelected);

  final List<String> availableTimes;
  final String selected;
  final Function onTimeSelected;
  @override
  _TimesOfDayState createState() => _TimesOfDayState();
}

class _TimesOfDayState extends State<TimesOfDay> {


  List<String> _times = ["9:30","12:30","15:30","20:40"];
  DateTime now = DateTime.now();

  DateTime _toDateTime(String time){
    return DateTime(now.year, now.month, now.day, int.parse(time.split(":")[0]), int.parse(time.split(":")[1]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: 
         Column(
            children:
            _times.map((time) => 
              Column(
                children: [
                  InkWell(
                    onTap: (){
                      if(this.widget.availableTimes.indexOf(time) > -1){
                          this.widget.onTimeSelected(time);
                      }
                    },
                    child: Time(_toDateTime(time), this.widget.selected == time, this.widget.availableTimes.indexOf(time) > -1),
                  ),
                  SizedBox(height: 20),  
                ],
              )
            ).toList(),
          ),
    );
  }
}