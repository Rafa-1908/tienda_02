import 'dart:convert';

class Productos {
  Productos({
    required this.id,
    required this.productosId,
    required this.producto,
    required this.cantidad,
    required this.fecha,
    required this.imagen,
    required this.categoria,
    required this.estado,
  });

  String id;
  int productosId;
  String producto;
  String cantidad;
  String fecha;
  String imagen;
  String categoria;
  String estado;

  factory Productos.fromJson(String str) => Productos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Productos.fromMap(Map<String, dynamic> json) => Productos(
        id: json["_id"],
        productosId: json["productosId"],
        producto: json["producto"],
        cantidad: json["cantidad"],
        fecha: json["fecha"],
        imagen: json["imagen"],
        categoria: json["categoria"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "productosId": productosId,
        "producto": producto,
        "cantidad": cantidad,
        "fecha": fecha,
        "imagen": imagen,
        "categoria": categoria,
        "estado": estado,
      };
}
