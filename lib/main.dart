import 'package:flappy_bird_clone/homepage.dart';
import 'package:flappy_bird_clone/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StartScreen(),
      routes: {
        HomePage.ROUTE_NAME: (context) => const HomePage(),
      },
    );
  }
}
