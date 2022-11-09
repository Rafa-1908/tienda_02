import 'package:tienda_02/models/bebidas.dart';

class BebidasLocal {
  static List<Bebidas> listaBebidas = [
    //Bebidas(id: 2, producto: 'GASEOSA', cantidad: '2'),
    //Bebidas(id: 1, producto: 'JUGO', cantidad: '4')
  ];

  void agregarBebidasItem(Bebidas bebidas) {
    listaBebidas.insert(0, bebidas);
  }

  void editarBebidasItem(Bebidas bebidas) {
    //BUSCAR PEDIDO Y ACTUALIZAR
    for (var i = 0; i < listaBebidas.length; i++) {
      if (listaBebidas[i].id == bebidas.id) {
        listaBebidas[i] = bebidas;
      }
    }
  }

  void eliminarBebidasItem(int index) {
    listaBebidas.removeAt(index);
  }

  int obtenerCantidadBebidas() {
    return listaBebidas.length;
  }
}
