import 'package:flutter/material.dart';
import 'package:tienda_02/models/abarrotes.dart';
import 'package:tienda_02/models/abarrotes_local.dart';
import 'package:tienda_02/widgets/menu_lateral.dart';

class AbarrotesScreen extends StatefulWidget {
  const AbarrotesScreen({super.key});

  @override
  State<AbarrotesScreen> createState() => _AbarrotesScreenState();
}

class _AbarrotesScreenState extends State<AbarrotesScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Abarrotes> listaAbarrotes = AbarrotesLocal.listaAbarrotes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ABARROTES'),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            for (final abarrotesItem in listaAbarrotes)
              ListTile(
                leading: const Icon(Icons.cookie),
                title: Text(
                    '${abarrotesItem.abarrotesId} - ${abarrotesItem.producto}'),
                subtitle: Text(abarrotesItem.cantidad),
                trailing: const Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, 'abarrotes_form',
                      arguments: abarrotesItem);
                },
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          agregarAbarrotesItem();
        },
        backgroundColor: Colors.red[400],
      ),
    );
  }

  void agregarAbarrotesItem() {
    Navigator.pushNamed(context, 'abarrotes_form');
  }
}
