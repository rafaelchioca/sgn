import 'package:flutter/material.dart';
import 'package:sgn/models/media.dart';
import 'package:sgn/widgets/editor.dart';

class FormularioNotas extends StatefulWidget {
  const FormularioNotas({Key? key}) : super(key: key);

  @override
  _FormularioNotasState createState() => _FormularioNotasState();
}

class _FormularioNotasState extends State<FormularioNotas> {
  final TextEditingController _controladorCampoNome = TextEditingController();
  final TextEditingController _controladorCampoDisciplina =
      TextEditingController();
  final TextEditingController _controladorCampoNota1 = TextEditingController();
  final TextEditingController _controladorCampoNota2 = TextEditingController();

  @override
  void dispose() {
    _controladorCampoNome.dispose();
    _controladorCampoDisciplina.dispose();
    _controladorCampoNota1.dispose();
    _controladorCampoNota2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[900],
        title: const Text(
          'Cadastrar Notas',
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
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNome,
              rotulo: 'Nome do aluno',
              dica: 'Nome Completo',
              icone: Icons.person,
            ),
            Editor(
              controlador: _controladorCampoDisciplina,
              rotulo: 'Nome da Disciplina',
              dica: 'Nome da Disciplina',
              icone: Icons.book,
            ),
            Editor(
              controlador: _controladorCampoNota1,
              rotulo: 'Nota 1',
              dica: '0.0',
              icone: Icons.star,
              tipoTeclado: TextInputType.number,
            ),
            Editor(
              controlador: _controladorCampoNota2,
              rotulo: 'Nota 2',
              dica: '0.0',
              icone: Icons.star,
              tipoTeclado: TextInputType.number,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red[900]),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                overlayColor: MaterialStateProperty.all(Colors.blue[900]),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              onPressed: () => _criaMedia(
                context,
                _controladorCampoNome.text,
                _controladorCampoDisciplina.text,
                double.tryParse(_controladorCampoNota1.text) ?? 0.0,
                double.tryParse(_controladorCampoNota2.text) ?? 0.0,
              ),
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  void _criaMedia(BuildContext context, String nome, String disciplina,
      double nota1, double nota2) {

    if (nome.isEmpty || disciplina.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos')),
      );
      return;
    }

    if (nota1 < 0 || nota1 > 10 || nota2 < 0 || nota2 > 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Notas devem estar entre 0 e 10')),
      );
      return;
    }

    double media = (nota1 + nota2) / 2;

    String situacao = media >= 6 ? 'Aprovado' : 'Reprovado';

    final mediaCriada = Media(
      nome: nome,
      disciplina: disciplina,
      nota1: nota1,
      nota2: nota2,
      situacao: situacao,
    );

    Navigator.pop(context, mediaCriada);
  }
}
