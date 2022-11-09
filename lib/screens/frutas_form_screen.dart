import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/frutas_local.dart';
import 'package:tienda_02/providers/frutas_provider.dart';

import '../models/frutas.dart';

class FrutasFormScreen extends StatefulWidget {
  const FrutasFormScreen({super.key});

  @override
  State<FrutasFormScreen> createState() => _FrutasFormScreenState();
}

class _FrutasFormScreenState extends State<FrutasFormScreen> {
  @override
  Widget build(BuildContext context) {
    final txtId = TextEditingController();
    final txtProducto = TextEditingController();
    final txtCantidad = TextEditingController();
//OBTENIENDO
    final Frutas? frutas =
        ModalRoute.of(context)!.settings.arguments as Frutas?;

    if (frutas != null) {
      txtId.text = frutas.id.toString();
      txtProducto.text = frutas.producto;
      txtCantidad.text = frutas.cantidad;
    } else {
      txtId.text = '0';
    }
    //BebidasLocal bebidasLocal = BebidasLocal();
    final frutasProvider = Provider.of<FrutasProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('INGRESE EL PEDIDO'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          // key: ,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'NÚMERO DE PEDIDO',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txtId,
                enabled: false,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'PRODUCTO',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txtProducto,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'CANTIDAD',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txtCantidad,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('GUARDAR'),
                onPressed: () {
                  //...
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Guardando')));
                  var frutas = Frutas(
                      id: '',
                      frutasId: 0,
                      producto: txtProducto.text,
                      cantidad: txtCantidad.text);
                  frutasProvider.postsaveFrutas(frutas);

                  //AGREGANDO PEDIDO A LA LISTA
                  /*if (int.parse(txtId.text) == 0) {
                    bebidasLocal.agregarBebidasItem(Bebidas(
                        id: bebidasLocal.obtenerCantidadBebidas() + 1,
                        producto: txtProducto.text,
                        cantidad: txtCantidad.text));
                  } else {
                    //EDITAR
                    bebidasLocal.editarBebidasItem(Bebidas(
                        id: int.parse(txtId.text),
                        producto: txtProducto.text,
                        cantidad: txtCantidad.text));
                  }*/

                  Navigator.pushReplacementNamed(context, 'frutas');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
