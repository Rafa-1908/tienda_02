import 'dart:convert';

import 'package:tienda_02/models/trabajadores_report.dart';

class TrabajadoresReportResponse {
  TrabajadoresReportResponse({
    required this.trabajadoresReport,
  });

  List<TrabajadoresReport> trabajadoresReport;

  factory TrabajadoresReportResponse.fromJson(String str) =>
      TrabajadoresReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TrabajadoresReportResponse.fromMap(Map<String, dynamic> json) =>
      TrabajadoresReportResponse(
        trabajadoresReport: List<TrabajadoresReport>.from(
            json["trabajadoresReport"]
                .map((x) => TrabajadoresReport.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "trabajadoresReport":
            List<dynamic>.from(trabajadoresReport.map((x) => x.toMap())),
      };
}
