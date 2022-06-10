import 'package:flutter/material.dart';
import 'Dados.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController usernameController = TextEditingController();
  String? thumbnail;
  String? error;
  String text = "";

  Future<List> filme() async {
    String url = "https://sujeitoprogramador.com/r-api/?api=filmes";
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception("Erro");
    }
  }

  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.white,
      body: _corpo(context),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Filmes"),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  _corpo(BuildContext context) {
    return _campo(context);
  }

  _botao(BuildContext context, String desc) {
    return RaisedButton(
      onPressed: () {
        _attValor(context, desc);
      },
      child: Text("Leia mais",
          style: TextStyle(color: Colors.white, fontSize: 20.0)),
      color: Colors.red,
    );
  }

  _campo(context) {
    return FutureBuilder<List>(
      future: filme(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Erro legal'),
          );
        }

        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                minVerticalPadding: 20,
                leading: Image.network(snapshot.data![index]['foto']),
                title: Text(snapshot.data![index]['nome']),
                trailing: _botao(context, snapshot.data![index]['sinopse']),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  _attValor(BuildContext context, String desc) {
    setState(() {
      return _onClickOutraTela(context, desc);
    });
  }

  _onClickOutraTela(BuildContext context, String result) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return Dados(
          valueResultado: result,
        );
      }),
    );
  }
}
