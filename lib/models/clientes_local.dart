import 'package:tienda_02/models/clientes.dart';

class ClientesLocal {
  static List<Clientes> listaClientes = [];

  void agregarClienteItem(Clientes clientes) {
    listaClientes.insert(0, clientes);
  }

  void editarClientesItem(Clientes clientes) {
    //BUSCAR PEDIDO Y ACTUALIZAR
    for (var i = 0; i < listaClientes.length; i++) {
      if (listaClientes[i].id == clientes.id) {
        listaClientes[i] = clientes;
      }
    }
  }

  void eliminarClientesItem(int index) {
    listaClientes.removeAt(index);
  }

  int obtenerCantidadClientes() {
    return listaClientes.length;
  }
}
