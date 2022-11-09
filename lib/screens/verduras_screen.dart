import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/verduras.dart';
import 'package:tienda_02/models/verduras_local.dart';
import 'package:tienda_02/providers/verduras_provider.dart';
import 'package:tienda_02/widgets/menu_lateral.dart';

class VerdurasScreen extends StatefulWidget {
  const VerdurasScreen({super.key});

  @override
  State<VerdurasScreen> createState() => _VerdurasScreenState();
}

class _VerdurasScreenState extends State<VerdurasScreen> {
  @override
  Widget build(BuildContext context) {
    //final List<Verduras> listaVerduras = VerdurasLocal.listaVerduras;
    final verdurasProvider = Provider.of<VerdurasProvider>(context);
    final List<Verduras> listaVerduras = verdurasProvider.listaVerduras;
    return Scaffold(
      appBar: AppBar(
        title: const Text('VERDURAS'),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            for (final verdurasItem in listaVerduras)
              ListTile(
                leading: const Icon(Icons.cookie),
                title: Text(
                    '${verdurasItem.verdurasId} - ${verdurasItem.producto}'),
                subtitle: Text(verdurasItem.cantidad),
                trailing: const Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, 'verduras_form',
                      arguments: verdurasItem);
                },
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          agregarVerdurasItem();
        },
        backgroundColor: Colors.red[400],
      ),
    );
  }

  void agregarVerdurasItem() {
    Navigator.pushNamed(context, 'verduras_form');
  }
}
