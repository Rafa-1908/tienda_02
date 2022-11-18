import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/productos.dart';
import 'package:tienda_02/models/productos_local.dart';
import 'package:tienda_02/providers/productos_provider.dart';
import 'package:tienda_02/widgets/menu_lateral.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {
  @override
  Widget build(BuildContext context) {
    final productosProvider = Provider.of<ProductosProvider>(context);
    final List<Productos> listaProductos = productosProvider.listaProductos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('PRODUCTOS'),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: ListView.builder(
            itemCount: listaProductos.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    margin: EdgeInsets.only(top: 30, bottom: 20),
                    width: double.infinity,
                    height: 350,
                    decoration: _cardBorders(),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            width: double.infinity,
                            height: 400,
                            child: FadeInImage(
                                placeholder:
                                    AssetImage('assets/Loadingemo.gif'),
                                image:
                                    NetworkImage(listaProductos[index].imagen),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          color: Color.fromARGB(184, 143, 108, 78),
                          child: ListTile(
                            leading: Icon(Icons.card_giftcard),
                            title: Text(
                              listaProductos[index].producto,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(184, 29, 31, 30),
                              ),
                            ),
                            subtitle: Text(
                              listaProductos[index].fecha,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            trailing: const Icon(Icons.arrow_right),
                            onTap: () {
                              Navigator.pushNamed(context, 'productos_form',
                                  arguments: listaProductos[index]);
                            },
                          ),
                        )
                      ],
                    ),
                  ));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          agregarProductosItem();
        },
        backgroundColor: Color.fromARGB(255, 10, 112, 41),
      ),
    );
  }

  void agregarProductosItem() {
    Navigator.pushNamed(context, 'productos_form');
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 144, 255, 64),
              offset: Offset(0, 10),
              blurRadius: 10)
        ]);
