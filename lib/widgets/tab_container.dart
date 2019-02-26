import 'package:flutter/material.dart';
import 'tab_base_conversion.dart';
import 'tab_arithmetic.dart';

class TabContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('BitViu'),
            bottom: TabBar(tabs: <Widget>[
              Tab(text: 'Bases', icon: Icon(Icons.layers)),
              Tab(text: 'Aritimética', icon: Icon(Icons.control_point)),
              Tab(text: 'Sobre', icon: Icon(Icons.settings_applications)),
            ]),
          ),
          body: TabBarView(children: <Widget>[
            TabBaseConversion(),
            TabArithmetic(),
            Icon(Icons.directions_bike),
          ]),
        ));
  }
}
