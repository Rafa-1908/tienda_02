import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/productos_local.dart';
import 'package:tienda_02/providers/productos_provider.dart';

import '../models/productos.dart';

class ProductosFormScreen extends StatefulWidget {
  const ProductosFormScreen({super.key});

  @override
  State<ProductosFormScreen> createState() => _ProductosFormScreenState();
}

enum Categoria { Dulces, Salados }

class _ProductosFormScreenState extends State<ProductosFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final txtId = TextEditingController();
  final txtProducto = TextEditingController();
  final txtCantidad = TextEditingController();
  final txtFecha = TextEditingController();
  final txtImagen = TextEditingController();
  Categoria? _catSeleccion = Categoria.Dulces;
  bool? _estadoActivado = false;
  bool formModificado = false;

  @override
  Widget build(BuildContext context) {
//OBTENIENDO
    final Productos? productos =
        ModalRoute.of(context)!.settings.arguments as Productos?;

    if (productos != null) {
      txtId.text = productos.productosId.toString();
      txtProducto.text = productos.producto;
      txtFecha.text = productos.fecha;
      txtCantidad.text = productos.cantidad;
      txtImagen.text = productos.imagen;
      if (productos.categoria == 'Categorias.abarrotes') {
        _catSeleccion = Categoria.Dulces;
      } else {
        _catSeleccion = Categoria.Salados;
      }

      _estadoActivado = (productos.estado == 'true') ? true : false;
    } else {
      txtId.text = '0';
    }
    //BebidasLocal bebidasLocal = BebidasLocal();
    final productosProvider = Provider.of<ProductosProvider>(context);
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
                controller: txtFecha,
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
                  var productos = Productos(
                      id: '',
                      productosId: int.parse(txtId.text),
                      producto: txtProducto.text,
                      cantidad: txtCantidad.text,
                      fecha: txtFecha.text,
                      imagen: txtImagen.text,
                      categoria: _catSeleccion.toString(),
                      estado: _estadoActivado.toString());
                  productosProvider.postsaveProductos(productos);

                  Navigator.pushReplacementNamed(context, 'productos');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
