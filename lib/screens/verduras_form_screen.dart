import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/verduras_local.dart';
import 'package:tienda_02/providers/verduras_provider.dart';

import '../models/verduras.dart';

class VerdurasFormScreen extends StatefulWidget {
  const VerdurasFormScreen({super.key});

  @override
  State<VerdurasFormScreen> createState() => _VerdurasFormScreenState();
}

class _VerdurasFormScreenState extends State<VerdurasFormScreen> {
  @override
  Widget build(BuildContext context) {
    final txtId = TextEditingController();
    final txtProducto = TextEditingController();
    final txtCantidad = TextEditingController();
//OBTENIENDO
    final Verduras? verduras =
        ModalRoute.of(context)!.settings.arguments as Verduras?;

    if (verduras != null) {
      txtId.text = verduras.id.toString();
      txtProducto.text = verduras.producto;
      txtCantidad.text = verduras.cantidad;
    } else {
      txtId.text = '0';
    }
    //VerdurasLocal verdurasLocal = VerdurasLocal();
    final verdurasProvider = Provider.of<VerdurasProvider>(context);
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
                  var verduras = Verduras(
                      id: '',
                      verdurasId: 0,
                      producto: txtProducto.text,
                      cantidad: txtCantidad.text);
                  verdurasProvider.postsaveVerduras(verduras);

                  //AGREGANDO PEDIDO A LA LISTA
                  /*if (int.parse(txtId.text) == 0) {
                    verdurasLocal.agregarVerdurasItem(Verduras(
                        id: verdurasLocal.obtenerCantidadVerduras() + 1,
                        producto: txtProducto.text,
                        cantidad: txtCantidad.text));
                  } else {
                    //EDITAR
                    verdurasLocal.editarVerdurasItem(Verduras(
                        id: int.parse(txtId.text),
                        producto: txtProducto.text,
                        cantidad: txtCantidad.text));
                  }*/

                  Navigator.pushReplacementNamed(context, 'verduras');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
