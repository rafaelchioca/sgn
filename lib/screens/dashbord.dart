import 'package:flutter/material.dart';
import 'package:sgn/screens/lista_medias.dart';
import 'package:sgn/widgets/item_dashboard.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[900],
        title: const Text(
          'Dashboard',
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
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            ItemDashboard(
              title: 'Notas',
              icon: Icons.assignment,
              color: Colors.red[900]!,
              onTap: () {
                Navigator.push(
                  context as BuildContext,
                  MaterialPageRoute(
                    builder: (context) {
                      return ListaMedias();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
