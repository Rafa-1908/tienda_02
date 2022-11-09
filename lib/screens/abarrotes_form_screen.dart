import 'package:flutter/material.dart';
import 'package:tienda_02/models/abarrotes_local.dart';

import '../models/abarrotes.dart';

class AbarrotesFormScreen extends StatefulWidget {
  const AbarrotesFormScreen({super.key});

  @override
  State<AbarrotesFormScreen> createState() => _AbarrotesFormScreenState();
}

class _AbarrotesFormScreenState extends State<AbarrotesFormScreen> {
  @override
  Widget build(BuildContext context) {
    final txtId = TextEditingController();
    final txtProducto = TextEditingController();
    final txtCantidad = TextEditingController();
//OBTENIENDO
    final Abarrotes? abarrotes =
        ModalRoute.of(context)!.settings.arguments as Abarrotes?;

    if (abarrotes != null) {
      txtId.text = abarrotes.id.toString();
      txtProducto.text = abarrotes.producto;
      txtCantidad.text = abarrotes.cantidad;
    } else {
      txtId.text = '0';
    }
    AbarrotesLocal abarrotesLocal = AbarrotesLocal();
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
                  //AGREGANDO PEDIDO A LA LISTA
                  /*if (int.parse(txtId.text) == 0) {
                    abarrotesLocal.agregarAbarrotesItem(Abarrotes(
                        id: abarrotesLocal.obtenerCantidadAbarrotes() + 1,
                        producto: txtProducto.text,
                        cantidad: txtCantidad.text));
                  } else {
                    //EDITAR
                    abarrotesLocal.editarAbarrotesItem(Abarrotes(
                        id: int.parse(txtId.text),
                        producto: txtProducto.text,
                        cantidad: txtCantidad.text));
                  }*/

                  Navigator.pushReplacementNamed(context, 'abarrotes');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
