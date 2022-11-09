import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/frutas.dart';
import 'package:tienda_02/models/frutas_local.dart';
import 'package:tienda_02/providers/frutas_provider.dart';
import 'package:tienda_02/widgets/menu_lateral.dart';

class FrutasScreen extends StatefulWidget {
  const FrutasScreen({super.key});

  @override
  State<FrutasScreen> createState() => _FrutasScreenState();
}

class _FrutasScreenState extends State<FrutasScreen> {
  @override
  Widget build(BuildContext context) {
    //final List<Bebidas> listaBebidas = BebidasLocal.listaBebidas;
    final frutasProvider = Provider.of<FrutasProvider>(context);
    final List<Frutas> listaFrutas = frutasProvider.listaFrutas;
    return Scaffold(
      appBar: AppBar(
        title: const Text('FRUTAS'),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            for (final frutasItem in listaFrutas)
              ListTile(
                leading: const Icon(Icons.apple),
                title: Text('${frutasItem.frutasId} - ${frutasItem.producto}'),
                subtitle: Text(frutasItem.cantidad),
                trailing: const Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, 'frutas_form',
                      arguments: frutasItem);
                },
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          agregarFrutasItem();
        },
        backgroundColor: Colors.red[400],
      ),
    );
  }

  void agregarFrutasItem() {
    Navigator.pushNamed(context, 'frutas_form');
  }
}
