import 'package:cinema_booking_1888/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'finder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupFinder();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
        primaryColor: const Color(0xff00befd),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}