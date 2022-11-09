import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/bebidas.dart';
import 'package:tienda_02/models/bebidas_local.dart';
import 'package:tienda_02/providers/bebidas_provider.dart';
import 'package:tienda_02/widgets/menu_lateral.dart';

class BebidasScreen extends StatefulWidget {
  const BebidasScreen({super.key});

  @override
  State<BebidasScreen> createState() => _BebidasScreenState();
}

class _BebidasScreenState extends State<BebidasScreen> {
  @override
  Widget build(BuildContext context) {
    //final List<Bebidas> listaBebidas = BebidasLocal.listaBebidas;
    final bebidasProvider = Provider.of<BebidasProvider>(context);
    final List<Bebidas> listaBebidas = bebidasProvider.listaBebidas;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BEBIDAS'),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            for (final bebidasItem in listaBebidas)
              ListTile(
                leading: const Icon(Icons.water),
                title:
                    Text('${bebidasItem.bebidasId} - ${bebidasItem.producto}'),
                subtitle: Text(bebidasItem.cantidad),
                trailing: const Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, 'bebidas_form',
                      arguments: bebidasItem);
                },
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          agregarBebidasItem();
        },
        backgroundColor: Colors.red[400],
      ),
    );
  }

  void agregarBebidasItem() {
    Navigator.pushNamed(context, 'bebidas_form');
  }
}
