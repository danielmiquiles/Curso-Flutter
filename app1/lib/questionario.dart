import 'package:app1/questao.dart';
import 'package:flutter/material.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List perguntas;
  final void Function(int) responder;

  Questionario(
      {@required this.perguntas,
      @required this.perguntaSelecionada,
      @required this.responder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> widgets = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...widgets.map((resp) {
          return Resposta(
            resp['texto'],
            () => responder(resp['pontuacao']),
          );
        }).toList(),
      ],
    );
  }
}
