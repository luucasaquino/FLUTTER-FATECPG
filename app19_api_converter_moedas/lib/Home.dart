import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController valorController = TextEditingController();
  String dropdownValor1 = 'Real';
  String dropdownValor2 = 'Real';
  String infoResultado = "Resultado";
  String text = "";
  num conta = 0;
  void _calcularSoma() async {
    String url = '';
    int valor = int.parse(valorController.text);
    String result = '';
    if ((dropdownValor1 == 'Real' && dropdownValor2 == 'Dólar')) {
      url = 'https://economia.awesomeapi.com.br/json/last/USD-BRL';
      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> body = json.decode(response.body);
      result = body['USDBRL']['ask'];
      conta = valor * num.parse(result);
      infoResultado =
          "Valor em $dropdownValor1: $valor\n Valor em $dropdownValor2: $conta";
    } else if ((dropdownValor2 == 'Real' && dropdownValor1 == 'Dólar')) {
      url = 'https://economia.awesomeapi.com.br/json/last/USD-BRL';
      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> body = json.decode(response.body);
      result = body['USDBRL']['ask'];
      conta = valor * num.parse(result);
      infoResultado =
          "Valor em $dropdownValor2: $valor\n Valor em $dropdownValor1: $conta";
    } else if ((dropdownValor1 == 'Real' && dropdownValor2 == 'Euro')) {
      url = 'https://economia.awesomeapi.com.br/json/last/EUR-BRL';
      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> body = json.decode(response.body);
      result = body['EURBRL']['ask'];
      conta = valor * num.parse(result);
      infoResultado =
          "Valor em $dropdownValor1: $valor\n Valor em $dropdownValor2: $conta";
    } else if ((dropdownValor2 == 'Real' && dropdownValor1 == 'Euro')) {
      url = 'https://economia.awesomeapi.com.br/json/last/EUR-BRL';
      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> body = json.decode(response.body);
      result = body['EURBRL']['ask'];
      conta = valor * num.parse(result);
      infoResultado =
          "Valor em $dropdownValor2: $valor\n Valor em $dropdownValor1: $conta";
    } else if ((dropdownValor1 == 'Dólar' && dropdownValor2 == 'Euro')) {
      url = 'https://economia.awesomeapi.com.br/json/last/EUR-USD';
      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> body = json.decode(response.body);
      result = body['EURUSD']['ask'];
      conta = valor * num.parse(result);
      infoResultado =
          "Valor em $dropdownValor1: $valor\n Valor em $dropdownValor2: $conta";
    } else {
      url = 'https://economia.awesomeapi.com.br/json/last/EUR-USD';
      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> body = json.decode(response.body);
      result = body['EURUSD']['ask'];
      conta = valor * num.parse(result);
      infoResultado =
          "Valor em $dropdownValor2: $valor\n Valor em $dropdownValor1: $conta";
    }

    setState(() {
      infoResultado;
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
      title: Text("Conversor de Moedas"),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _campo("Valor", valorController),
          _dropdown("De: "),
          _dropdown2("Para: "),
          _botao(),
          _texto(infoResultado),
        ],
      ),
    );
  }

  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
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
          child: Text("Descobrir",
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
          items: <String>['Euro', 'Dólar', 'Real'].map((String value) {
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
          items: <String>['Euro', 'Dólar', 'Real'].map((String value) {
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
}
