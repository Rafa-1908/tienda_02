import 'package:tienda_02/models/productos.dart';

class ProductosLocal {
  static List<Productos> listaProductos = [];

  void agregarProductosItem(Productos productos) {
    listaProductos.insert(0, productos);
  }

  void editarProductosItem(Productos productos) {
    //BUSCAR PEDIDO Y ACTUALIZAR
    for (var i = 0; i < listaProductos.length; i++) {
      if (listaProductos[i].id == productos.id) {
        listaProductos[i] = productos;
      }
    }
  }

  void eliminarProductosItem(int index) {
    listaProductos.removeAt(index);
  }

  int obtenerCantidadProductos() {
    return listaProductos.length;
  }
}
