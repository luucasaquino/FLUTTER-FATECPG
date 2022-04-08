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
      title: Text("Anúncios"),
      centerTitle: true,
      backgroundColor: Colors.orange,
    );
  }

  _corpo() {
    return Container(
      child: PageView(
        children: <Widget>[
          _anuncios(
              'https://i.ytimg.com/vi/CMFhfr42QLg/maxresdefault.jpg',
              'https://exame.com/wp-content/uploads/2019/12/tudoisso.jpg',
              'http://1.bp.blogspot.com/_cFNQFlRXhYM/TAipBr6wdiI/AAAAAAAABzo/DdQxkEUg2E0/s1600/Revista.jpg'),
          _anuncios(
              'http://3.bp.blogspot.com/-_fhPhgTI1Qw/VFlX_CAJlwI/AAAAAAAAAFM/8gdG2J_oaW8/s1600/Garota%2Bda%2BCapa_Anncio.jpg',
              'https://www.almapbbdo.com.br/static/upload/general/92b6338a-255e-4400-aae0-28a700d7a9bf.jpg',
              'https://ri.magazineluiza.com.br/images/thumb-magalu.png'),
        ],
      ),
    );
  }

  _anuncios(String foto1, String foto2, String foto3) {
    return Container(
      margin: EdgeInsets.all(4),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(1),
            child: Image.network(
              foto1,
              height: 150,
              width: 115,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.all(1),
            child: Image.network(
              foto2,
              height: 150,
              width: 115,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.all(1),
            child: Image.network(
              foto3,
              height: 150,
              width: 115,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
