import 'package:flutter/material.dart';
import 'package:twozerofoureight/presentation/screens/home/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2048',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
