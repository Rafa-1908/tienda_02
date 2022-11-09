import 'dart:convert';

class Frutas {
  Frutas({
    required this.id,
    required this.cantidad,
    required this.producto,
    required this.frutasId,
  });

  String id;
  String cantidad;
  String producto;
  int frutasId;

  factory Frutas.fromJson(String str) => Frutas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Frutas.fromMap(Map<String, dynamic> json) => Frutas(
        id: json["_id"],
        cantidad: json["cantidad"],
        producto: json["producto"],
        frutasId: json["frutasId"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "cantidad": cantidad,
        "producto": producto,
        "frutasId": frutasId,
      };
}
