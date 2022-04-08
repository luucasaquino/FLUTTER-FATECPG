import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();

  bool valorSwitch = false;
  double valorSlider = 0;
  String infoResultado = "Dados: ";
  String dropdownValor1 = 'M';
  String dropdownValor2 = 'Ensino médio completo';
  String br = "";

  void _calcularSoma() {
    setState(() {
      String nome = nomeController.text;
      int idade = int.parse(idadeController.text);
      if (valorSwitch)
        br = "Sim";
      else
        br = "Não";

      infoResultado =
          'Nome: $nome\n\nIdade: $idade\n\nSexo: $dropdownValor1\n\nEscolaridade: $dropdownValor2\n\nLimite: $valorSlider\n\nBrasileiro; $br';
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
      title: Text("Abertura de conta"),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _campo("Nome", nomeController),
          _campo("Idade", idadeController),
          _dropdown("Sexo "),
          _dropdown2(""),
          _texto("Limite"),
          _slider(),
          _textoSlider(valorSlider),
          _texto("Brasileiro"),
          _switch(),
          _botao(),
          _texto(infoResultado),
        ],
      ),
    );
  }

  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.red)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red, fontSize: 19.0),
      controller: objController,
    );
  }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcularSoma,
          child: Text("Confirmar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.red,
        ),
      ),
    );
  }

  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red, fontSize: 25.0),
    );
  }

  _dropdown(String text) {
    return Row(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
        DropdownButton<String>(
          value: dropdownValor1,
          items: <String>['M', 'F'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? valorSelecionado) {
            setState(() {
              dropdownValor1 = valorSelecionado!;
            });
          },
        ),
      ],
    );
  }

  _dropdown2(String text) {
    return Row(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
        DropdownButton<String>(
          value: dropdownValor2,
          items: <String>[
            'Ensino médio completo',
            'Ensino médio incompleto',
            'Cursando'
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? valorSelecionado) {
            setState(() {
              dropdownValor2 = valorSelecionado!;
            });
          },
        ),
      ],
    );
  }

  _slider() {
    return Slider(
      value: valorSlider,
      min: 0,
      max: 1000,
      divisions: 50,
      label: valorSlider.round().toString(),
      onChanged: (double value) {
        setState(() {
          valorSlider = value;
        });
      },
    );
  }

  _textoSlider(double valor) {
    return Text(
      valor.toStringAsPrecision(3),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  _switch() {
    return Switch(
      value: valorSwitch,
      onChanged: (value) {
        setState(() {
          valorSwitch = value;
        });
      },
      activeTrackColor: Colors.blue,
      activeColor: Colors.white,
    );
  }
}
