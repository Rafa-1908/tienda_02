import 'dart:convert';

class Venta {
  Venta({
    required this.id,
    required this.ventaId,
    required this.productosId,
    required this.cantidad,
    required this.precio,
    required this.total,
  });

  String id;
  int ventaId;
  int productosId;
  int cantidad;
  int precio;
  int total;

  factory Venta.fromJson(String str) => Venta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Venta.fromMap(Map<String, dynamic> json) => Venta(
        id: json["_id"],
        ventaId: json["ventaId"],
        productosId: json["productosId"],
        cantidad: json["cantidad"],
        precio: json["precio"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "ventaId": ventaId,
        "productosId": productosId,
        "cantidad": cantidad,
        "precio": precio,
        "total": total,
      };
}
