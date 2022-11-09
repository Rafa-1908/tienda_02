import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/limpieza.dart';
import 'package:tienda_02/models/limpieza_local.dart';
import 'package:tienda_02/providers/limpieza_provider.dart';
import 'package:tienda_02/widgets/menu_lateral.dart';

class LimpiezaScreen extends StatefulWidget {
  const LimpiezaScreen({super.key});

  @override
  State<LimpiezaScreen> createState() => _LimpiezaScreenState();
}

class _LimpiezaScreenState extends State<LimpiezaScreen> {
  @override
  Widget build(BuildContext context) {
    //final List<Bebidas> listaBebidas = BebidasLocal.listaBebidas;
    final limpiezaProvider = Provider.of<LimpiezaProvider>(context);
    final List<Limpieza> listaLimpieza = limpiezaProvider.listaLimpieza;
    return Scaffold(
      appBar: AppBar(
        title: const Text('LIMPIEZA'),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            for (final limpiezaItem in listaLimpieza)
              ListTile(
                leading: const Icon(Icons.shop),
                title: Text(
                    '${limpiezaItem.limpiezaId} - ${limpiezaItem.producto}'),
                subtitle: Text(limpiezaItem.cantidad),
                trailing: const Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, 'limpieza_form',
                      arguments: limpiezaItem);
                },
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          agregarLimpiezaItem();
        },
        backgroundColor: Colors.red[400],
      ),
    );
  }

  void agregarLimpiezaItem() {
    Navigator.pushNamed(context, 'limpieza_form');
  }
}
