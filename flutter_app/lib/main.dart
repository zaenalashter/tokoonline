import 'package:flutter/material.dart';
import 'package:flutter_app/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jaenal Store',
      home: HomePage(),
    );
  }
}
