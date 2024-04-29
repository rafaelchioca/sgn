import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;
  final Color? cor;
  final TextInputType? tipoTeclado;

  Editor({this.controlador, this.rotulo, this.dica, this.icone, this.cor, this.tipoTeclado});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: const TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          icon: icone != null
              ? Icon(
                  icone,
                  color: cor != null ? cor : Colors.white,
                )
              : null,
          labelText: rotulo,
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          hintStyle: const TextStyle(color: Colors.white38),
          hintText: dica,
        ),
        keyboardType: tipoTeclado != null ? tipoTeclado : TextInputType.text,
      ),
    );
  }
}