import 'dart:convert';

class Verduras {
  Verduras({
    required this.id,
    required this.cantidad,
    required this.producto,
    required this.verdurasId,
  });

  String id;
  String cantidad;
  String producto;
  int verdurasId;

  factory Verduras.fromJson(String str) => Verduras.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Verduras.fromMap(Map<String, dynamic> json) => Verduras(
        id: json["_id"],
        cantidad: json["cantidad"],
        producto: json["producto"],
        verdurasId: json["verdurasId"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "cantidad": cantidad,
        "producto": producto,
        "verdurasId": verdurasId,
      };
}
