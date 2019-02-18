import 'package:flutter/material.dart';
import 'widgets/tab_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BitViu',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.red[800],
          accentColor: Colors.black,
      ),
      home: TabContainer(),
    );
  }
}
