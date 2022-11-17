import 'dart:convert';

class Proveedores {
  Proveedores({
    required this.id,
    required this.proveedoresId,
    required this.producto,
    required this.cantidad,
    required this.fecha,
    required this.imagen,
    required this.proveedor,
    required this.estado,
  });

  String id;
  int proveedoresId;
  String producto;
  String cantidad;
  String fecha;
  String imagen;
  String proveedor;
  String estado;

  factory Proveedores.fromJson(String str) =>
      Proveedores.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Proveedores.fromMap(Map<String, dynamic> json) => Proveedores(
        id: json["_id"],
        proveedoresId: json["proveedoresId"],
        producto: json["producto"],
        cantidad: json["cantidad"],
        fecha: json["fecha"],
        imagen: json["imagen"],
        proveedor: json["proveedor"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "proveedoresId": proveedoresId,
        "producto": producto,
        "cantidad": cantidad,
        "fecha": fecha,
        "imagen": imagen,
        "proveedor": proveedor,
        "estado": estado,
      };
}
