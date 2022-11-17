import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/proveedores_local.dart';
import 'package:tienda_02/providers/proveedores_provider.dart';

import '../models/proveedores.dart';

class ProveedoresFormScreen extends StatefulWidget {
  const ProveedoresFormScreen({super.key});

  @override
  State<ProveedoresFormScreen> createState() => _ProveedoresFormScreenState();
}

enum Proveedor { Lesaffre, Alicorp }

class _ProveedoresFormScreenState extends State<ProveedoresFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final txtId = TextEditingController();
  final txtProducto = TextEditingController();
  final txtCantidad = TextEditingController();
  final txtFecha = TextEditingController();
  final txtImagen = TextEditingController();
  Proveedor? _catSeleccion = Proveedor.Lesaffre;
  bool? _estadoActivado = false;
  bool formModificado = false;

  @override
  Widget build(BuildContext context) {
//OBTENIENDO
    final Proveedores? proveedores =
        ModalRoute.of(context)!.settings.arguments as Proveedores?;
    if (!formModificado) {
      if (proveedores != null) {
        //EDITAR
        txtId.text = proveedores.proveedoresId.toString();
        txtProducto.text = proveedores.producto;
        txtCantidad.text = proveedores.cantidad;
        txtFecha.text = proveedores.fecha;
        txtImagen.text = proveedores.imagen;
        if (proveedores.proveedor == 'Proveedor.Lesafree') {
          _catSeleccion = Proveedor.Lesaffre;
        } else {
          _catSeleccion = Proveedor.Alicorp;
        }

        _estadoActivado = (proveedores.estado == 'true') ? true : false;
      } else {
        //NUEVO
        txtId.text = '0';
      }
    }

    final proveedoresProvider = Provider.of<ProveedoresProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('INGRESE DATOS DEL PROVEEDOR'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese el nombre del Producto';
                  }
                },
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese la cantidad a pedir';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'FECHA DE RECEPCIÓN',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txtFecha,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese la fecha indicada';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'IMAGEN',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txtImagen,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese una Imagen';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text('PROVEEDOR'),
                  SizedBox(width: 20),
                  Radio(
                      value: Proveedor.Lesaffre,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Proveedor?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('LESAFFRE'),
                  SizedBox(width: 20),
                  Radio(
                    value: Proveedor.Alicorp,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Proveedor?;
                        print(_catSeleccion);
                        formModificado = true;
                      });
                    },
                  ),
                  Text('ALICORP'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Text('ESTADO'),
                  SizedBox(width: 20),
                  Checkbox(
                    value: _estadoActivado,
                    onChanged: ((value) {
                      setState(() {
                        _estadoActivado = value;
                        print(_estadoActivado);
                        formModificado = true;
                      });
                    }),
                  ),
                  Text('Activo')
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: const Text('GUARDAR'),
                onPressed: () {
                  //...
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Guardando')));
                    var proveedores = Proveedores(
                        id: '',
                        proveedoresId: int.parse(txtId.text),
                        producto: txtProducto.text,
                        cantidad: txtCantidad.text,
                        fecha: txtFecha.text,
                        imagen: txtImagen.text,
                        proveedor: _catSeleccion.toString(),
                        estado: _estadoActivado.toString());
                    proveedoresProvider.postsaveProveedores(proveedores);

                    Navigator.pushReplacementNamed(context, 'proveedores');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
