import 'package:cinema_booking_1888/models/seating_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:xml/xml.dart';

class SeatService {

  Future<SeatingBlock> getSeatingBlock(BuildContext context) async {
    final value = await DefaultAssetBundle.of(context)
        .loadString("data/hall_1_block_a.xml");

    final document = XmlDocument.parse(value);
    final block = document.findAllElements('Block').first;
    int row = int.parse(block.getElement("row").text);
    int column = int.parse(block.getElement("row").text);
    List<String> booked = block.getElement("booked").text.split(",");

    return SeatingBlock(row, column, booked);
  }
}