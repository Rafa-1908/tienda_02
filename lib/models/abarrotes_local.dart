import 'package:tienda_02/models/abarrotes.dart';

class AbarrotesLocal {
  static List<Abarrotes> listaAbarrotes = [
    //Abarrotes(id: 2, producto: 'LECHE', cantidad: '1'),
    //Abarrotes(id: 1, producto: 'FIDEOS', cantidad: '2')
  ];

  void agregarAbarrotesItem(Abarrotes abarrotes) {
    listaAbarrotes.insert(0, abarrotes);
  }

  void editarAbarrotesItem(Abarrotes abarrotes) {
    //BUSCAR PEDIDO Y ACTUALIZAR
    for (var i = 0; i < listaAbarrotes.length; i++) {
      if (listaAbarrotes[i].id == abarrotes.id) {
        listaAbarrotes[i] = abarrotes;
      }
    }
  }

  void eliminarAbarrotesItem(int index) {
    listaAbarrotes.removeAt(index);
  }

  int obtenerCantidadAbarrotes() {
    return listaAbarrotes.length;
  }
}
