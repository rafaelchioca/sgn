import 'package:flutter/material.dart';

class Media {
  final String? nome;
  final String? disciplina;
  final double? nota1;
  final double? nota2;
  final String? situacao;

  Media({this.nome, this.disciplina, this.nota1, this.nota2, this.situacao});

  double get media => (nota1! + nota2!) / 2;

  Color get cor {
    if (media < 6) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}
