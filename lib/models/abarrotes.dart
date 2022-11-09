import 'dart:convert';

class Abarrotes {
  Abarrotes({
    required this.id,
    required this.cantidad,
    required this.producto,
    required this.abarrotesId,
  });

  String id;
  String cantidad;
  String producto;
  int abarrotesId;

  factory Abarrotes.fromJson(String str) => Abarrotes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Abarrotes.fromMap(Map<String, dynamic> json) => Abarrotes(
        id: json["_id"],
        cantidad: json["cantidad"],
        producto: json["producto"],
        abarrotesId: json["abarrotesId"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "cantidad": cantidad,
        "producto": producto,
        "abarrotesId": abarrotesId,
      };
}
