import 'package:tienda_02/models/proveedores.dart';

class ProveedoresLocal {
  static List<Proveedores> listaProveedores = [];

  void agregarProveedoresItem(Proveedores proveedores) {
    listaProveedores.insert(0, proveedores);
  }

  void editarProveedoresItem(Proveedores proveedores) {
    //BUSCAR PEDIDO Y ACTUALIZAR
    for (var i = 0; i < listaProveedores.length; i++) {
      if (listaProveedores[i].id == proveedores.id) {
        listaProveedores[i] = proveedores;
      }
    }
  }

  void eliminarProveedoresItem(int index) {
    listaProveedores.removeAt(index);
  }

  int obtenerCantidadProveedores() {
    return listaProveedores.length;
  }
}
