import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.quandoResponder,
      super.key});

  final List<Map<String, dynamic>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : [];

    return Column(children: [
      Questao(perguntas[perguntaSelecionada]['texto']),
      ...respostas.map((resp) {
        return Resposta(resp['texto'], () => quandoResponder(resp['ponto']));
      }).toList(),
    ]);
  }
}
