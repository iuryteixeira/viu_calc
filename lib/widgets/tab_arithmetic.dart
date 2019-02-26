import 'package:flutter/material.dart';

class TabArithmetic extends StatefulWidget {
  @override
  TabArithmeticState createState() {
    return TabArithmeticState();
  }
}

class TabArithmeticState extends State<TabArithmetic> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
      constraints: BoxConstraints(
      minHeight: 30.0,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('Soma de Binários'),
                subtitle: Text('Use apenas 0 e 1 junto ao operador (+)'),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'teste'
                ),
              ),
              ButtonTheme.bar( // make buttons use the appropriate styles for cards
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () { /* ... */ },
                    ),
                    FlatButton(
                      child: const Text('LISTEN'),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              ButtonTheme.bar( // make buttons use the appropriate styles for cards
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () { /* ... */ },
                    ),
                    FlatButton(
                      child: const Text('LISTEN'),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),),
    );
  }
}
