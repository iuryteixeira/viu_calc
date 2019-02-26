import 'package:flutter/material.dart';

class TabBaseConversion extends StatefulWidget {
  @override
  TabBaseConversionState createState() {
    return TabBaseConversionState();
  }
}

class TabBaseConversionState extends State<TabBaseConversion> {
  final TextEditingController _binController = TextEditingController();
  final TextEditingController _octController = TextEditingController();
  final TextEditingController _decController = TextEditingController();
  final TextEditingController _hexController = TextEditingController();

  bool _binFieldIsValid = true;
  bool _octFieldIsValid = true;
  bool _decFieldIsValid = true;
  bool _hexFieldIsValid = true;

  _clearAllFields() {
    setState(() {
      _binController.text = '';
      _decController.text = '';
      _octController.text = '';
      _hexController.text = '';
    });
  }

  _executeByBase2(value) {
    if (value.toString().isNotEmpty) {
      int decNumber = int.tryParse(value, radix: 2);
      setState(() {
        _decController.text = decNumber.toString();
        _octController.text = decNumber.toRadixString(8);
        _hexController.text = decNumber.toRadixString(16).toUpperCase();
        _binFieldIsValid = true;
      });
    } else {
      setState(() {
        _decController.text = '';
        _octController.text = '';
        _hexController.text = '';
        _binFieldIsValid = false;
      });
    }
  }

  _executeByBase8(value) {
    if (value.toString().isNotEmpty) {
      int decNumber = int.tryParse(value, radix: 8);
      setState(() {
        _binController.text = decNumber.toRadixString(2);
        _decController.text = decNumber.toString();
        _hexController.text = decNumber.toRadixString(16).toUpperCase();
        _octFieldIsValid = true;
      });
    } else {
      setState(() {
        _decController.text = '';
        _octController.text = '';
        _hexController.text = '';
        _octFieldIsValid = false;
      });
    }
  }

  _executeByBase10(value) {
    if (value.toString().isNotEmpty) {
      int intValue = int.tryParse(value);
      setState(() {
        _binController.text = intValue.toRadixString(2);
        _octController.text = intValue.toRadixString(8);
        _hexController.text = intValue.toRadixString(16).toUpperCase();
        _decFieldIsValid = true;
      });
    } else {
      setState(() {
        _binController.text = '';
        _octController.text = '';
        _hexController.text = '';
        _decFieldIsValid = false;
      });
    }
  }

  _executeByBase16(value) {
    if (value.toString().isNotEmpty) {
      int decNumber = int.tryParse(value, radix: 16);
      setState(() {
        _binController.text = decNumber.toRadixString(2);
        _decController.text = decNumber.toString();
        _octController.text = decNumber.toRadixString(8).toUpperCase();
        _hexFieldIsValid = true;
      });
    } else {
      setState(() {
        _binController.text = '';
        _decController.text = '';
        _octController.text = '';
        _hexFieldIsValid = false;
      });
    }
  }

  @override
  void dispose() {
    _binController.dispose();
    _octController.dispose();
    _decController.dispose();
    _hexController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 7.0),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Conversão de Bases',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                ),
              ),
            ),
            TextField(
              maxLines: 1,
              controller: _binController,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.create),
                hintText: 'insira aqui um valor em binário',
                labelText: 'Valor em Base 2',
                errorText:
                    _binFieldIsValid ? null : 'Valor não é um binário válido',
              ),
              onChanged: (value) => _executeByBase2(value),
              keyboardType: TextInputType.number,
            ),
            TextField(
              maxLines: 1,
              controller: _octController,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.create),
                hintText: 'insira aqui um valor em octa',
                labelText: 'Valor em Base 8',
                errorText:
                    _octFieldIsValid ? null : 'Valor não é um octal válido',
              ),
              onChanged: (value) => _executeByBase8(value),
              keyboardType: TextInputType.number,
            ),
            TextField(
              maxLines: 1,
              controller: _decController,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.create),
                hintText: 'insira aqui um valor em decimal',
                labelText: 'Valor em Base 10',
                errorText:
                    _decFieldIsValid ? null : 'Valor não é um decimal válido',
              ),
              onChanged: (value) => _executeByBase10(value),
              keyboardType: TextInputType.number,
            ),
            TextField(
              maxLines: 1,
              controller: _hexController,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.create),
                hintText: 'insira aqui um valor em hexa',
                labelText: 'Valor em Base 16',
                errorText: _hexFieldIsValid
                    ? null
                    : 'Valor não é um hexadecimal válido',
              ),
              onChanged: (value) => _executeByBase16(value),
              keyboardType: TextInputType.text,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    MaterialButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      height: 50.0,
                      minWidth: 150.0,
                      onPressed: () {
                        _clearAllFields();
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Campos limpos :)')));
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.clear_all),
                          Text('Limpar'),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
