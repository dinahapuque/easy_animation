import 'package:easy_animation/src/add_page.dart';
import 'package:easy_animation/src/details_page.dart';
import 'package:easy_animation/src/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => DetailsPage(),
        '/add': (context) => AddPage(),
      },
    );
  }
}
