import 'package:flutter/material.dart';

class BaseConversionTab extends StatefulWidget {
  @override
  BaseConversionTabState createState() {
    return BaseConversionTabState();
  }
}

class BaseConversionTabState extends State<BaseConversionTab> {
  final TextEditingController _binController = TextEditingController();
  final TextEditingController _octController = TextEditingController();
  final TextEditingController _decController = TextEditingController();
  final TextEditingController _hexController = TextEditingController();

  bool _binFieldIsValid = true;
  bool _decFieldIsValid = true;

  _executeByBase2(value) {
    if (value.toString().isNotEmpty) {
      int binValue = int.tryParse(value, radix: 2);
      int intValue = int.tryParse(value);
      setState(() {
        _octController.text = intValue.toRadixString(8);
        _decController.text = intValue.toRadixString(10);
        _hexController.text = intValue.toRadixString(16);

        _binFieldIsValid = true;
      });
    } else {
      setState(() {
        _binFieldIsValid = false;
      });
    }
  }

  _executeByBase10(value) {
    if (value.toString().isNotEmpty) {
      int intValue = int.tryParse(value);
      setState(() {
        _binController.text = intValue.toRadixString(2);
        _octController.text = intValue.toRadixString(8);
        _hexController.text = intValue.toRadixString(16);

        _decFieldIsValid = true;
      });
    } else {
      setState(() {
        _decFieldIsValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        TextField(
          controller: _binController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'insira aqui um valor em binário',
            labelText: 'Valor em Base 2',
            errorText:
                _binFieldIsValid ? null : 'Valor não é um binário válido',
          ),
          autofocus: true,
          onChanged: (value) => _executeByBase2(value),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: _octController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'insira aqui um valor em octa',
            labelText: 'Valor em Base 8',
          ),
          autofocus: true,
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: _decController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'insira aqui um valor em decimal',
            labelText: 'Valor em Base 10',
            errorText:
                _decFieldIsValid ? null : 'Valor não é um decimal válido',
          ),
          onChanged: (value) => _executeByBase10(value),
          autofocus: true,
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: _hexController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'insira aqui um valor em hexa',
            labelText: 'Valor em Base 16',
          ),
          autofocus: true,
          keyboardType: TextInputType.text,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Campos limpos :)')));
                  },
                  child: Text('Limpar'),
                ),

              ],
            ))
      ],
    );
  }
}
