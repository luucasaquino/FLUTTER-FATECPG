import 'package:flutter/material.dart';

class Dados extends StatelessWidget {
  String valueResultado;

  Dados({required this.valueResultado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('$valueResultado',
              style: TextStyle(color: Colors.red, fontSize: 20.0)),
        ],
      ),
    );
  }
}
