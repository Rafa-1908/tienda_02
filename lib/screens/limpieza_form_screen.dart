import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/limpieza_local.dart';
import 'package:tienda_02/providers/limpieza_provider.dart';

import '../models/limpieza.dart';

class LimpiezaFormScreen extends StatefulWidget {
  const LimpiezaFormScreen({super.key});

  @override
  State<LimpiezaFormScreen> createState() => _LimpiezaFormScreenState();
}

class _LimpiezaFormScreenState extends State<LimpiezaFormScreen> {
  @override
  Widget build(BuildContext context) {
    final txtId = TextEditingController();
    final txtProducto = TextEditingController();
    final txtCantidad = TextEditingController();
//OBTENIENDO
    final Limpieza? limpieza =
        ModalRoute.of(context)!.settings.arguments as Limpieza?;

    if (limpieza != null) {
      txtId.text = limpieza.id.toString();
      txtProducto.text = limpieza.producto;
      txtCantidad.text = limpieza.cantidad;
    } else {
      txtId.text = '0';
    }

    final limpiezaProvider = Provider.of<LimpiezaProvider>(context);
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
                  var limpieza = Limpieza(
                      id: '',
                      limpiezaId: 0,
                      producto: txtProducto.text,
                      cantidad: txtCantidad.text);
                  limpiezaProvider.postsaveLimpieza(limpieza);

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
