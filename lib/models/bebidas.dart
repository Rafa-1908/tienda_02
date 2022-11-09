import 'dart:convert';

class Bebidas {
  Bebidas({
    required this.id,
    required this.cantidad,
    required this.producto,
    required this.bebidasId,
  });

  String id;
  String cantidad;
  String producto;
  int bebidasId;

  factory Bebidas.fromJson(String str) => Bebidas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Bebidas.fromMap(Map<String, dynamic> json) => Bebidas(
        id: json["_id"],
        cantidad: json["cantidad"],
        producto: json["producto"],
        bebidasId: json["bebidasId"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "cantidad": cantidad,
        "producto": producto,
        "bebidasId": bebidasId,
      };
}
