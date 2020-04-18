import 'package:app1/questionario.dart';
import 'package:app1/resultado.dart';
import 'package:flutter/material.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = [
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 2},
        {'texto': 'Elefante', 'pontuacao': 7},
        {'texto': 'Leão', 'pontuacao': 9},
      ]
    },
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 1},
        {'texto': 'Vermelho', 'pontuacao': 8},
        {'texto': 'Verde', 'pontuacao': 6},
        {'texto': 'Branco', 'pontuacao': 4},
      ]
    },
    {
      'texto': 'Qual o seu intrutor favorito?',
      'respostas': [
        {'texto': 'Diogenes', 'pontuacao': 1},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Raoni', 'pontuacao': 10},
        {'texto': 'Rachel', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Qual foi seu pior intrutor?',
      'respostas': [
        {'texto': 'Diogenes', 'pontuacao': 9},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Raoni', 'pontuacao': 0},
        {'texto': 'Rachel', 'pontuacao': 10},
      ]
    },
  ];

  void _responder(int pontuacao) {
    setState(() {
      if (temPerguntaSelecionada) {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      }
      print(_pontuacaoTotal);
    });
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Perguntas')),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                responder: _responder,
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
              )
            : Resultado(_pontuacaoTotal,_reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    // TODO: implement createState
    return _PerguntaAppState();
  }
}
