import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta(this.texto, this.onSelected,{Key? key}) : super(key: key);
  final String texto;
  final void Function() onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelected,
        child: Text(texto),
        style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              color: Colors.white,
            ),
            backgroundColor: Colors.blue),
      ),
    );
  }
}
