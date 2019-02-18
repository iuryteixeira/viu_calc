import 'package:flutter/material.dart';
import 'tab_base_conversion.dart';

class TabContainer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('BitViu'),
            bottom: TabBar(
                tabs: <Widget>[
                  Tab(text: 'Conversão de Bases',),
                  Tab(text: 'Aritimética Binária', icon: Icon(Icons.control_point)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ]
            ),
          ),
          body: TabBarView(
              children: <Widget>[
                BaseConversionTab(),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
              ]),
        )
    );
  }
}