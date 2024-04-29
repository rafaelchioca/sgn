import 'package:flutter/material.dart';
import 'package:sgn/models/media.dart';
import 'package:sgn/screens/formulario_notas.dart';
import 'package:sgn/widgets/item_media.dart';

class ListaMedias extends StatefulWidget {
  ListaMedias({super.key});
  final List<Media> _medias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaMediasState();
  }
}

class ListaMediasState extends State<ListaMedias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[900],
        title: const Text(
          'Lista de Médias',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
        ),
        child: ListView.builder(
          itemCount: widget._medias.length,
          itemBuilder: (context, indice) {
            final media = widget._medias[indice];
            return ItemMedia(media);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[900],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioNotas();
              },
            ),
          ).then((mediaRecebida) {
            if (mediaRecebida != null) {
              setState(() {
                widget._medias.add(mediaRecebida);
              });
            }
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
