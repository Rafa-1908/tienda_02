import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tienda_02/models/productos.dart';
import 'package:tienda_02/models/venta.dart';
import 'package:tienda_02/providers/productos_provider.dart';
import 'package:tienda_02/providers/venta_providers.dart';
import 'package:tienda_02/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';

class VentaScreen extends StatefulWidget {
  const VentaScreen({super.key});

  @override
  State<VentaScreen> createState() => _VentaScreenState();
}

class _VentaScreenState extends State<VentaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Ventas'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.add_business)),
                Tab(icon: Icon(Icons.add_circle)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            )),
        drawer: const MenuLateral(),
        body: TabBarView(children: [
          _TabVenta(),
          Icon(Icons.add_circle),
          Icon(Icons.add_circle_outline)
        ]),
      ),
    ));
  }
}

class _TabVenta extends StatefulWidget {
  _TabVenta({super.key});

  @override
  State<_TabVenta> createState() => _TabVentaState();
}

class _TabVentaState extends State<_TabVenta> {
  final _formKey = GlobalKey<FormState>();
  int? dbProductosId = 0;
  final txtCantidad = TextEditingController();
  final txtPrecio = TextEditingController();
  var txtTotal = 0;

  @override
  Widget build(BuildContext context) {
    final productosProvider = Provider.of<ProductosProvider>(context);
    final List<Productos> listaProductos = productosProvider.listaProductos;
    final ventaProvider = Provider.of<VentaProvider>(context);

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Text('Formulario de Venta'),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                    labelText: 'Pedido', border: OutlineInputBorder()),
                value: listaProductos[0].productosId,
                items: listaProductos.map((productos) {
                  return DropdownMenuItem(
                    value: productos.productosId,
                    child: Row(
                      children: <Widget>[
                        Image.network(productos.imagen, width: 50, height: 50),
                        const SizedBox(width: 10),
                        Text(productos.producto)
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dbProductosId = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Cantidad', border: OutlineInputBorder()),
                controller: txtCantidad,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la cantidad';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    txtTotal =
                        int.parse(txtCantidad.text) * int.parse(txtPrecio.text);
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Precio', border: OutlineInputBorder()),
                controller: txtPrecio,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la cantidad';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    txtTotal =
                        int.parse(txtCantidad.text) * int.parse(txtPrecio.text);
                  });
                },
              ),
              const SizedBox(height: 20),
              Text('Total: $txtTotal'),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Vendiendo...')));
                      print('productosId: $dbProductosId,'
                          'cantidad:${txtCantidad.text},'
                          'precio:${txtPrecio.text},'
                          'total:$txtTotal.text');
                      var venta = Venta(
                          id: '',
                          ventaId: 0,
                          productosId: int.parse(dbProductosId.toString()),
                          cantidad: int.parse(txtCantidad.text),
                          precio: int.parse(txtPrecio.text),
                          total: txtTotal);
                      ventaProvider.postSaveVenta(venta);
                    }
                  },
                  child: const Text('VENDER')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {}, child: const Text('NUEVA VENTA')),
            ],
          )),
    );
  }
}
