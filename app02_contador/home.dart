import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  int infoResultado = 0;

  void _calcularSoma() {
    setState(() {
      infoResultado++;
    });
  }

  void _calcularSub() {
    setState(() {
      if (infoResultado > 0) infoResultado--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Contador de pessoas"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _corpo() {
    return Container(
      width: double.infinity,
      color: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _texto(),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            _botaoSoma(),
            _botaoSub(),
          ]),
        ],
      ),
    );
  }

  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.green)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green, fontSize: 25.0),
      controller: objController,
    );
  }

  _botaoSoma() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 10.0),
      child: Container(
        child: FloatingActionButton(
          onPressed: _calcularSoma,
          child:
              Text("+", style: TextStyle(color: Colors.white, fontSize: 20.0)),
        ),
      ),
    );
  }

  _botaoSub() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        child: FloatingActionButton(
          onPressed: _calcularSub,
          child:
              Text("-", style: TextStyle(color: Colors.white, fontSize: 20.0)),
        ),
      ),
    );
  }

  _texto() {
    return Text(
      '$infoResultado',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red, fontSize: 25.0),
    );
  }
}
