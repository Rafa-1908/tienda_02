import 'dart:convert';

class TrabajadoresReport {
  TrabajadoresReport({
    required this.id,
    required this.count,
  });

  String id;
  int count;

  factory TrabajadoresReport.fromJson(String str) =>
      TrabajadoresReport.fromJson(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TrabajadoresReport.fromMap(Map<String, dynamic> json) =>
      TrabajadoresReport(
        id: json["_id"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
      };
}
