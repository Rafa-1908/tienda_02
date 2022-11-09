import 'package:tienda_02/models/frutas.dart';

class FrutasLocal {
  static List<Frutas> listaFrutas = [
    // Frutas(id: 2, producto: 'MANZANA', cantidad: '1'),
    //Frutas(id: 1, producto: 'PIÑA', cantidad: '2')
  ];

  void agregarFrutasItem(Frutas frutas) {
    listaFrutas.insert(0, frutas);
  }

  void editarFrutasItem(Frutas frutas) {
    //BUSCAR PEDIDO Y ACTUALIZAR
    for (var i = 0; i < listaFrutas.length; i++) {
      if (listaFrutas[i].id == frutas.id) {
        listaFrutas[i] = frutas;
      }
    }
  }

  void eliminarFrutasItem(int index) {
    listaFrutas.removeAt(index);
  }

  int obtenerCantidadFrutas() {
    return listaFrutas.length;
  }
}
