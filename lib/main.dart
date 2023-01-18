import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setWindowSizeDesktop();
  runApp(const PerguntaApp());
}

setWindowSizeDesktop() async {
  if (Platform.isWindows) {
    await DesktopWindow.setWindowSize(
        Size(392.72727272727275, 803.6363636363636));
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, dynamic>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'ponto': 10},
        {'texto': 'Vermelho', 'ponto': 5},
        {'texto': 'Verde', 'ponto': 3},
        {'texto': 'Branco', 'ponto': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'ponto': 10},
        {'texto': 'Cobra', 'ponto': 5},
        {'texto': 'Elefante', 'ponto': 3},
        {'texto': 'Leão', 'ponto': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'ponto': 10},
        {'texto': 'João', 'ponto': 5},
        {'texto': 'Leo', 'ponto': 3},
        {'texto': 'Pedro', 'ponto': 1},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
