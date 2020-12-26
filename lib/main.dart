import 'package:cinema_booking_1888/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'finder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupFinder();
  runApp(HomePage());
}