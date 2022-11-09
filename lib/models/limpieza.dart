import 'dart:convert';

class Limpieza {
  Limpieza({
    required this.id,
    required this.cantidad,
    required this.producto,
    required this.limpiezaId,
  });

  String id;
  String cantidad;
  String producto;
  int limpiezaId;

  factory Limpieza.fromJson(String str) => Limpieza.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Limpieza.fromMap(Map<String, dynamic> json) => Limpieza(
        id: json["_id"],
        cantidad: json["cantidad"],
        producto: json["producto"],
        limpiezaId: json["limpiezaId"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "cantidad": cantidad,
        "producto": producto,
        "limpiezaId": limpiezaId,
      };
}
