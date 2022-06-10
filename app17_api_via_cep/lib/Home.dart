import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController cepController = TextEditingController();
  String error = "";
  String text = "";
  _recuperarCep() async {
    if (cepController.text.length != 8) return;

    String url = 'https://viacep.com.br/ws/${cepController.text}/json/';
    http.Response response = await http.get(Uri.parse(url));

    setState(() {
      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);

        if (body["cep"] == "" || body["cep"] == null) {
          text = "Digite um cep válido";
          return;
        } else {
          String log = body["logradouro"];
          String bairro = body["bairro"];
          String cidade = body["localidade"];
          String estado = body["uf"];
          String cep = body["cep"];
          text =
              "CEP: $cep\nLogradouro: $log\nBairro: $bairro\nCidade: $cidade\nEstado: $estado";
        }
      } else {
        text = "Digite um cep válido";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consulta de CEP"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Digite o CEP",
                      labelStyle: TextStyle(color: Colors.green)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.green, fontSize: 25.0),
                  controller: cepController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  maxLength: 8,
                  onChanged: (value) {
                    setState(() {
                      error = "";
                    });
                  },
                )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: _recuperarCep,
                    child: const Icon(
                      Icons.send,
                      size: 18,
                    ))
              ],
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
