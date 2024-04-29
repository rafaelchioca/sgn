import 'package:flutter/material.dart';
import 'package:sgn/models/media.dart';

class ItemMedia extends StatelessWidget {
  final Media _media;

  const ItemMedia(this._media, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(255, 255, 255, 0.1),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          _media.nome!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          _media.disciplina!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min, // Garante que o Row ocupe apenas o espaço necessário
          mainAxisAlignment: MainAxisAlignment.end, // Alinha os elementos à direita
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: _media.cor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  _media.media.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            Text(
              _media.situacao!,
              style: TextStyle(
                color: _media.cor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
