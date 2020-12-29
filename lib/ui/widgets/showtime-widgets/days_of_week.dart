import 'package:flutter/material.dart';

import 'day_widget.dart';

class DaysOfWeek extends StatelessWidget {
  const DaysOfWeek(this.selectedDate, this.onSelectedDateChange);

  final DateTime selectedDate;
  final Function onSelectedDateChange;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<DateTime> _days = List.generate(5, (index) => now.add(Duration(days: index)));
    final aDate = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
    return 
    SafeArea(
      minimum: const EdgeInsets.all(5.0),
      child:
        Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: MediaQuery.of(context).size.width - 10),
        child: 
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
              _days.map((day) => 
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        onSelectedDateChange(day);
                      },
                      child: Day(day,  DateTime(day.year, day.month, day.day) == aDate),
                    ),
                    SizedBox(width: 20),  
                  ],
                )
              ).toList(),
            ),
          )
      ),
    );
  }
}