import 'package:flutter/material.dart';
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

  handleUsername() async{
     String url = "https://api.github.com/users/${usernameController.text}";
      http.Response response = await http.get(Uri.parse(url));
       Map<String, dynamic> retorno = json.decode(response.body);
    int id = retorno["id"];
    String login = retorno["login"];
    String repos_url = retorno["repos_url"];
    String created_at = retorno["created_at"];
    String followers_url = retorno["followers_url"];
    String following_url = retorno["following_url"];

    setState(()  {
      if (response.statusCode == 200) {
        text = "Id: $id\nNome: $login\nRepositórios: $repos_url\nCriado em: $created_at\nSeguidores: $followers_url\nSeguindo: $following_url";
      } else {}
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Github Devs",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black54,
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(2, 20, 2, 20),
      child: Wrap(
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: <Widget>[
          Align(
            child: Image.network(
                thumbnail ??
                    "https://cdn-icons-png.flaticon.com/512/25/25231.png",
                width: 80),
          ),
          Row(
            children: [
              Flexible(
                  child: TextField(
                cursorColor: Colors.black54,
                decoration: const InputDecoration(
                    labelText: "Digite seu nome de usuário",
                    labelStyle: TextStyle(color: Colors.black54)),
                style: const TextStyle(color: Colors.black54),
                controller: usernameController,
              )),
              ElevatedButton(
                  onPressed: handleUsername,
                  style: ElevatedButton.styleFrom(primary: Colors.black54),
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 16,
                  ))
            ],
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
