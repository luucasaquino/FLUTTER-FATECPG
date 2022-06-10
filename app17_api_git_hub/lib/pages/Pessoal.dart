import 'package:flutter/material.dart';

class Pessoal extends StatelessWidget {
  const Pessoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      appBar: _titulo(),
    );
  }

  _body(BuildContext context) {
    return SingleChildScrollView(child: _text());
  }
}

_text() {
  return Container(
    child: Text(
        'Temos medo de estarmos conosco, mergulharmos em nosso interior. O silêncio e sua prática nos leva a esta possibilidade de encontro profundo e revitalizador. Com o silêncio, encontramos a paz e o amor incondicional vem com toda a força transformadora. O amor é a força mais sutil do mundo. O mundo está farto de ódio. É é este ódio irracional e distante da força criadora que destrói, corrompe e ensurdece a humanidade. Pare! Recomece! Reprograme-se... O silêncio pode ser o ponto-chave desta nova caminhada. Pratique-o diariamente e transforme um pouco nosso mundo. Ouça-se.'),
    margin: EdgeInsets.only(left: 8, top: 12),
  );
}

_titulo() {
  return AppBar(
    title: Text("Pessoal"),
    centerTitle: true,
    backgroundColor: Colors.blue,
  );
}
