import 'package:flutter/material.dart';
import 'package:tienda_02/models/trabajadores_report.dart';
import 'package:tienda_02/providers/trabajadores_provider.dart';
import 'package:tienda_02/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReporteTrabajadoresScreen extends StatefulWidget {
  const ReporteTrabajadoresScreen({super.key});

  @override
  State<ReporteTrabajadoresScreen> createState() =>
      _ReporteTrabajadoresScreenState();
}

class _ReporteTrabajadoresScreenState extends State<ReporteTrabajadoresScreen> {
  @override
  Widget build(BuildContext context) {
    final trabajadoresProvider = Provider.of<TrabajadoresProvider>(context);

    final List<TrabajadoresReport> listaTrabajadoresReport =
        trabajadoresProvider.listaTrabajadoresReport;

    List<charts.Series<TrabajadoresReport, String>> serie = [
      charts.Series(
        id: 'Trabajadores',
        data: listaTrabajadoresReport,
        domainFn: (TrabajadoresReport serie, _) => serie.id,
        measureFn: (TrabajadoresReport serie, _) => serie.count,
        colorFn: (TrabajadoresReport serie, _) =>
            charts.ColorUtil.fromDartColor(Colors.blueAccent),
      )
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Reportes Trabajadores')),
      drawer: MenuLateral(),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('REPORTE DE TRABAJADORES'),
                  Expanded(
                      child: charts.BarChart(
                    serie,
                    animate: true,
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
