import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _corpo(),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Vagas"),
      centerTitle: true,
      backgroundColor: Colors.orange,
    );
  }

  _corpo() {
    return Container(
      child: ListView(
        children: <Widget>[
          _vaga('Analista', 2500, 'desc', 'a@a.com'),
          _vaga('Médico', 7000, 'desc', 'a@a.com'),
          _vaga('Engenheiro', 5500, 'desc', 'a@a.com'),
          _vaga('Piloto de nave', 3400, 'desc', 'a@a.com'),
          _vaga('Químico', 5800, 'desc', 'a@a.com'),
          _vaga('Atendente do Mc Donalds', 100, 'desc', 'a@a.com'),
        ],
      ),
    );
  }

  _vaga(String nome, double salary, String desc, String cont) {
    return Container(
      margin: EdgeInsets.all(20),
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Text(
            "$nome",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text("Salário: R\$ $salary"),
          Text("Descrição: $desc"),
          Text("Contato: $cont"),
        ],
      ),
    );
  }
}
