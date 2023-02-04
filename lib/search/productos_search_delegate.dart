import 'package:flutter/material.dart';
import 'package:tienda_02/models/productos.dart';

class ProductosSearchDelegate extends SearchDelegate<Productos> {
  final List<Productos> listaProductos;
  ProductosSearchDelegate(this.listaProductos);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.backspace),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.amberAccent,
      ),
      onPressed: () {
        close(
            context,
            Productos(
                id: '',
                productosId: 0,
                producto: '',
                cantidad: '',
                fecha: '',
                imagen: '',
                categoria: '',
                estado: ''));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaFiltrada = query.isEmpty
        ? listaProductos
        : listaProductos
            .where((productos) =>
                productos.producto.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, index) {
        return _cardProductos(listaFiltrada[index], context);
      },
    );
  }

  Widget _cardProductos(Productos productosFiltrado, context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(productosFiltrado.imagen),
            ),
            title: Text(productosFiltrado.producto),
            subtitle: Text(productosFiltrado.fecha),
            onTap: () {
              Navigator.pushNamed(context, 'productos_form',
                  arguments: productosFiltrado);
            },
          )
        ],
      ),
    );
  }
}
