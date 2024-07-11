import 'package:flutter/material.dart';
import 'package:horoscope_app/route_generator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}
