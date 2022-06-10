import 'package:flutter/material.dart';

class Experiencia extends StatelessWidget {
  const Experiencia({Key? key}) : super(key: key);

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
        'Costuma-se pensar a educação do ponto de vista da relação entre a ciência e a técnica ou, às vezes, doponto de vista da relação entre teoria e prática. Se o par ciência/técnica remete a uma perspectiva positiva e retificadora, o par teoria/prática remete sobretudo a uma perspectiva política e crítica. De fato, somente nesta última perspectiva tem sentido a palavra “reflexão” e expressões como “reflexão crítica”, “reflexão sobre prática ou não prática”, “reflexão emancipadora” etc. Se na primeira alternativa as pessoas que trabalham em educação são concebidas como sujeitos técnicos que aplicam com maior ou menor eficácia as diversas tecnologias pedagógicas produzidas pelos cientistas, pelos técnicos e pelos especialistas, na segunda alternativa estas mesmas pessoas aparecem como sujeitos críticos que, armados de distintas estratégias reflexivas, se comprometem, com maior ou menor êxito, com práticas educativas concebidas na maioria das vezes sob uma perspectiva política. Tudo isso é suficientemente conhecido, posto que nas últimas décadas o campo pedagógico tem estado separado entre os chamados técnicos e os chamados críticos, entre os partidários da educação como ciência aplicada e os partidários da educação como práxis política, e não vou retomar a discussão. O que vou lhes propor aqui é que exploremos juntos outra possibilidade, digamos que mais existencial (sem ser existencialista) e mais estética (sem ser esteticista), a saber, pensar a educação a partir do par experiência/sentido. O que vou fazer em seguida é sugerir certo significado para estas duas palavras em distintos contextos, e depois vocês me dirão como isto lhes soa. O que vou fazer é, simplesmente, explorar algumas palavras e tratar de compartilhá-las.)'),
    margin: EdgeInsets.only(left: 8, top: 12),
  );
}

_titulo() {
  return AppBar(
    title: Text("Experiência"),
    centerTitle: true,
    backgroundColor: Colors.blue,
  );
}
