import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/clientes_local.dart';
import 'package:tienda_02/providers/clientes_provider.dart';

import '../models/clientes.dart';

class ClientesFormScreen extends StatefulWidget {
  const ClientesFormScreen({super.key});

  @override
  State<ClientesFormScreen> createState() => _ClientesFormScreenState();
}

enum Tipo { Vip, Normal }

class _ClientesFormScreenState extends State<ClientesFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final txtId = TextEditingController();
  final txtNombre = TextEditingController();
  final txtDni = TextEditingController();
  final txtFecha = TextEditingController();
  final txtImagen = TextEditingController();
  Tipo? _catSeleccion = Tipo.Vip;
  bool? _estadoActivado = false;
  bool formModificado = false;

  @override
  Widget build(BuildContext context) {
//OBTENIENDO
    final Clientes? clientes =
        ModalRoute.of(context)!.settings.arguments as Clientes?;
    if (!formModificado) {
      if (clientes != null) {
        //EDITAR
        txtId.text = clientes.clientesId.toString();
        txtNombre.text = clientes.nombre;
        txtDni.text = clientes.dni;
        txtFecha.text = clientes.fecha;
        txtImagen.text = clientes.imagen;
        if (clientes.tipo == 'Tipo.Clientes') {
          _catSeleccion = Tipo.Vip;
        } else {
          _catSeleccion = Tipo.Normal;
        }

        _estadoActivado = (clientes.estado == 'true') ? true : false;
      } else {
        //NUEVO
        txtId.text = '0';
      }
    }

    final clientesProvider = Provider.of<ClientesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('INGRESE EL CLIENTE'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'NÚMERO DE CLIENTE',
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
                    labelText: 'CLIENTE',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txtNombre,
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
                    labelText: 'DNI',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txtDni,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese la cantidad deseada';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'FECHA',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txtFecha,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese una fecha';
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
                  Text('TIPO'),
                  SizedBox(width: 20),
                  Radio(
                      value: Tipo.Vip,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Tipo?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('VIP'),
                  SizedBox(width: 20),
                  Radio(
                    value: Tipo.Normal,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Tipo?;
                        print(_catSeleccion);
                        formModificado = true;
                      });
                    },
                  ),
                  Text('NORMAL'),
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
                    var clientes = Clientes(
                        id: '',
                        clientesId: int.parse(txtId.text),
                        nombre: txtNombre.text,
                        dni: txtDni.text,
                        fecha: txtFecha.text,
                        imagen: txtImagen.text,
                        tipo: _catSeleccion.toString(),
                        estado: _estadoActivado.toString());
                    clientesProvider.postsaveClientes(clientes);

                    Navigator.pushReplacementNamed(context, 'clientes');
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
