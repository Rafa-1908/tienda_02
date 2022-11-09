import 'package:tienda_02/models/verduras.dart';

class VerdurasLocal {
  static List<Verduras> listaVerduras = [
    // Verduras(id: 2, producto: 'ZANAHORIA', cantidad: '1'),
    //Verduras(id: 1, producto: 'BROCOLI', cantidad: '1')
  ];

  void agregarVerdurasItem(Verduras verduras) {
    listaVerduras.insert(0, verduras);
  }

  void editarVerdurasItem(Verduras verduras) {
    //BUSCAR PEDIDO Y ACTUALIZAR
    for (var i = 0; i < listaVerduras.length; i++) {
      if (listaVerduras[i].id == verduras.id) {
        listaVerduras[i] = verduras;
      }
    }
  }

  void eliminarVerdurasItem(int index) {
    listaVerduras.removeAt(index);
  }

  int obtenerCantidadVerduras() {
    return listaVerduras.length;
  }
}
