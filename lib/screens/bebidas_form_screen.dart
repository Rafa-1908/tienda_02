import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/bebidas_local.dart';
import 'package:tienda_02/providers/bebidas_provider.dart';

import '../models/bebidas.dart';

class BebidasFormScreen extends StatefulWidget {
  const BebidasFormScreen({super.key});

  @override
  State<BebidasFormScreen> createState() => _BebidasFormScreenState();
}

class _BebidasFormScreenState extends State<BebidasFormScreen> {
  @override
  Widget build(BuildContext context) {
    final txtId = TextEditingController();
    final txtProducto = TextEditingController();
    final txtCantidad = TextEditingController();
//OBTENIENDO
    final Bebidas? bebidas =
        ModalRoute.of(context)!.settings.arguments as Bebidas?;

    if (bebidas != null) {
      txtId.text = bebidas.id.toString();
      txtProducto.text = bebidas.producto;
      txtCantidad.text = bebidas.cantidad;
    } else {
      txtId.text = '0';
    }
    //BebidasLocal bebidasLocal = BebidasLocal();
    final bebidasProvider = Provider.of<BebidasProvider>(context);
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
                  var bebidas = Bebidas(
                      id: '',
                      bebidasId: 0,
                      producto: txtProducto.text,
                      cantidad: txtCantidad.text);
                  bebidasProvider.postsaveBebidas(bebidas);

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

                  Navigator.pushReplacementNamed(context, 'bebidas');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
