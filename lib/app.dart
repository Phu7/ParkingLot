
import 'package:flutter/material.dart';
import 'package:parkinglot/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parkinglot Space Finder',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Home(),
    );
  }
}