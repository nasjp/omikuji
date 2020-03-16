import 'package:flutter/material.dart';

import 'package:omikuji/ui/top_page.dart';
import 'package:omikuji/repositories/fortune_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omikuji',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: TopPage(FortuneRepository()),
    );
  }
}
