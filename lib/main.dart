import 'package:flutter/material.dart';
import 'package:flutter_animated_starter/helpers/colors.dart';
import 'package:flutter_animated_starter/screens/getstarted.dart';
import 'package:flutter_animated_starter/widgets/backgroundcircle.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const GetStarted(),
    );
  }
}
