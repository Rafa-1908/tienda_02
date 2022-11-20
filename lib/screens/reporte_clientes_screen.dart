import 'package:flutter/material.dart';
import 'package:tienda_02/models/clientes_report.dart';
import 'package:tienda_02/providers/clientes_provider.dart';
import 'package:tienda_02/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReporteClientesScreen extends StatefulWidget {
  const ReporteClientesScreen({super.key});

  @override
  State<ReporteClientesScreen> createState() => _ReporteClientesScreenState();
}

class _ReporteClientesScreenState extends State<ReporteClientesScreen> {
  @override
  Widget build(BuildContext context) {
    final clientesProvider = Provider.of<ClientesProvider>(context);

    final List<ClientesReport> listaClientesReport =
        clientesProvider.listaClientesReport;

    List<charts.Series<ClientesReport, String>> serie = [
      charts.Series(
        id: 'Clientes',
        data: listaClientesReport,
        domainFn: (ClientesReport serie, _) => serie.id,
        measureFn: (ClientesReport serie, _) => serie.count,
        colorFn: (ClientesReport serie, _) =>
            charts.ColorUtil.fromDartColor(Color.fromARGB(255, 21, 108, 36)),
      )
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Reportes Clientes')),
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
                  Text('REPORTE DE CLIENTES'),
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
