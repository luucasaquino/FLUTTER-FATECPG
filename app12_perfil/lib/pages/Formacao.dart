import 'package:flutter/material.dart';

class Formacao extends StatelessWidget {
  const Formacao({Key? key}) : super(key: key);

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
        'Durante muito tempo o espaço do texto ficou relegado ao trabalho com análise lingüística, o ensino tradicional tomava como unidade de estudo a estrutura da oração e do período. A partir da década de oitenta, opondo-se a essa maneira de ensino da língua portuguesa, começam a despontar propostas de trabalho que tomam o texto como unidade de estudo essencial e com o reflexo das contribuições da Lingüística Textual, da Teoria dos gêneros, da Sociolingüística, da Análise do Discurso, passou-se a ver o texto como unidade básica da interação verbal. Tomamos como base, o conceito de gênero textual apresentado por Bakthin (1997). Segundo ele, os gêneros textuais são formas relativamente estáveis de enunciados que se definem por aspectos relacionados ao conteúdo, à composição estrutural e aos traços lingüísticos, extremamente ligados aos contextos (condições e finalidades) nos quais estão inseridos. É por esta dependência com relação ao contexto que eles são historicamente variáveis. Assim, a imensa diversidade de gêneros é que forma a língua. As práticas pedagógicas de língua materna tem sido alvo de uma constante preocupação. Afinal, muitas são as dificuldades dos alunos no que diz respeito ao desenvolvimento da proficiência em leitura e compreensão de texto. No entanto, não podemos esquecer que é papel da escola como um todo tornar nossos alunos capazes de utilizar a linguagem como instrumento de aprendizagem, sabendo fazer uso de informações contidas nos textos, bem como conhecer e analisar criticamente os usos da língua como veículo de valores e preconceitos de classe, credo, gênero ou etnia.)'),
    margin: EdgeInsets.only(left: 8, top: 12),
  );
}

_titulo() {
  return AppBar(
    title: Text("Formação"),
    centerTitle: true,
    backgroundColor: Colors.blue,
  );
}
