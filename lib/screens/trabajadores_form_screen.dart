import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/trabajadores_local.dart';
import 'package:tienda_02/providers/trabajadores_provider.dart';

import '../models/trabajadores.dart';

class TrabajadoresFormScreen extends StatefulWidget {
  const TrabajadoresFormScreen({super.key});

  @override
  State<TrabajadoresFormScreen> createState() => _TrabajadoresFormScreenState();
}

enum Turno { Maniana, Tarde }

class _TrabajadoresFormScreenState extends State<TrabajadoresFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final txtId = TextEditingController();
  final txtNombre = TextEditingController();
  final txtDni = TextEditingController();
  final txtFecha = TextEditingController();
  final txtImagen = TextEditingController();
  Turno? _catSeleccion = Turno.Maniana;
  bool? _estadoActivado = false;
  bool formModificado = false;

  @override
  Widget build(BuildContext context) {
//OBTENIENDO
    final Trabajadores? trabajadores =
        ModalRoute.of(context)!.settings.arguments as Trabajadores?;
    if (!formModificado) {
      if (trabajadores != null) {
        //EDITAR
        txtId.text = trabajadores.trabajadoresId.toString();
        txtNombre.text = trabajadores.nombre;
        txtDni.text = trabajadores.dni;
        txtFecha.text = trabajadores.fecha;
        txtImagen.text = trabajadores.imagen;
        if (trabajadores.turno == 'Turno.Mañana') {
          _catSeleccion = Turno.Maniana;
        } else {
          _catSeleccion = Turno.Tarde;
        }

        _estadoActivado = (trabajadores.estado == 'true') ? true : false;
      } else {
        //NUEVO
        txtId.text = '0';
      }
    }

    final trabajadoresProvider = Provider.of<TrabajadoresProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('INGRESE LOS DATOS DEL TRABAJADOR'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'NÚMERO DE TRABAJADOR',
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
                    labelText: 'NOMBRE',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txtNombre,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese el nombre del Trabajador';
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
                    return 'Por favor ingrese el DNI';
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
                  Text('TURNO'),
                  SizedBox(width: 20),
                  Radio(
                      value: Turno.Maniana,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Turno?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('MAÑANA'),
                  SizedBox(width: 20),
                  Radio(
                    value: Turno.Tarde,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Turno?;
                        print(_catSeleccion);
                        formModificado = true;
                      });
                    },
                  ),
                  Text('TARDE'),
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
                    var trabajadores = Trabajadores(
                        id: '',
                        trabajadoresId: int.parse(txtId.text),
                        nombre: txtNombre.text,
                        dni: txtDni.text,
                        fecha: txtFecha.text,
                        imagen: txtImagen.text,
                        turno: _catSeleccion.toString(),
                        estado: _estadoActivado.toString());
                    trabajadoresProvider.postsaveTrabajadores(trabajadores);

                    Navigator.pushReplacementNamed(context, 'trabajadores');
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
