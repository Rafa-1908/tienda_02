import 'package:tienda_02/models/trabajadores.dart';

class TrabajadoresLocal {
  static List<Trabajadores> listaTrabajadores = [];

  void agregarTrabajadoresItem(Trabajadores trabajadores) {
    listaTrabajadores.insert(0, trabajadores);
  }

  void editarTrabajadoresItem(Trabajadores trabajadores) {
    //BUSCAR PEDIDO Y ACTUALIZAR
    for (var i = 0; i < listaTrabajadores.length; i++) {
      if (listaTrabajadores[i].id == trabajadores.id) {
        listaTrabajadores[i] = trabajadores;
      }
    }
  }

  void eliminarTrabajadoresItem(int index) {
    listaTrabajadores.removeAt(index);
  }

  int obtenerCantidadTrabajadores() {
    return listaTrabajadores.length;
  }
}
