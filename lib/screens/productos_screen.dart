import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/productos.dart';
import 'package:tienda_02/models/productos_local.dart';
import 'package:tienda_02/providers/productos_provider.dart';
import 'package:tienda_02/search/productos_search_delegate.dart';
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('PRODUCTOS'),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: ProductosSearchDelegate(listaProductos));
            },
          )
        ],
      ),
      drawer: const MenuLateral(),
      body: Container(
        width: double.infinity,
        height: size.height * 0.7,
        color: Color.fromARGB(255, 241, 238, 230),
        child: Swiper(
          itemCount: listaProductos.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.8,
          itemHeight: size.height * 0.7,
          itemBuilder: (BuildContext context, index) {
            return _cardProductos(listaProductos[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'productos_form');
        },
        backgroundColor: Colors.green[400],
      ),
    );
  }
}

class _cardProductos extends StatelessWidget {
  final Productos productos;
  _cardProductos(this.productos);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 140, bottom: 20),
      width: double.infinity,
      height: size.height * 0.5,
      decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [_ImagenFondo(productos), _EtiquetaPrecio(productos)],
      ),
    );
  }
}

class _ImagenFondo extends StatelessWidget {
  final Productos productos;
  _ImagenFondo(this.productos);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
          placeholder: AssetImage('assets/Loadingemo.gif'),
          image: NetworkImage(productos.imagen),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _EtiquetaPrecio extends StatelessWidget {
  final Productos productos;
  _EtiquetaPrecio(this.productos);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: ListTile(
        title: Text(
          productos.producto,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        subtitle: Text(
          productos.fecha,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit, color: Colors.blueAccent),
          onPressed: () {
            Navigator.pushNamed(context, 'productos_form',
                arguments: productos);
          },
        ),
      ),
    );
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
