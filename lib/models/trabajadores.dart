import 'dart:convert';

class Trabajadores {
  Trabajadores({
    required this.id,
    required this.fecha,
    required this.nombre,
    required this.dni,
    required this.trabajadoresId,
    required this.imagen,
    required this.turno,
    required this.estado,
  });

  String id;
  String fecha;
  String nombre;
  String dni;
  int trabajadoresId;
  String imagen;
  String turno;
  String estado;

  factory Trabajadores.fromJson(String str) =>
      Trabajadores.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Trabajadores.fromMap(Map<String, dynamic> json) => Trabajadores(
        id: json["_id"],
        fecha: json["fecha"],
        nombre: json["nombre"],
        dni: json["dni"],
        trabajadoresId: json["trabajadoresId"],
        imagen: json["imagen"],
        turno: json["turno"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "fecha": fecha,
        "nombre": nombre,
        "dni": dni,
        "trabajadoresId": trabajadoresId,
        "imagen": imagen,
        "turno": turno,
        "estado": estado,
      };
}
