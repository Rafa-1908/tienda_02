import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/proveedores.dart';
import 'package:tienda_02/models/proveedores_local.dart';
import 'package:tienda_02/providers/proveedores_provider.dart';
import 'package:tienda_02/widgets/menu_lateral.dart';

class ProveedoresScreen extends StatefulWidget {
  const ProveedoresScreen({super.key});

  @override
  State<ProveedoresScreen> createState() => _ProveedoresScreenState();
}

class _ProveedoresScreenState extends State<ProveedoresScreen> {
  @override
  Widget build(BuildContext context) {
    final proveedoresProvider = Provider.of<ProveedoresProvider>(context);
    final List<Proveedores> listaProveedores =
        proveedoresProvider.listaProveedores;

    return Scaffold(
      appBar: AppBar(
        title: const Text('PROVEEDORES'),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: ListView.builder(
            itemCount: listaProveedores.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    margin: EdgeInsets.only(top: 30, bottom: 20),
                    width: double.infinity,
                    height: 350,
                    decoration: _cardBorders(),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            width: double.infinity,
                            height: 400,
                            child: FadeInImage(
                                placeholder:
                                    AssetImage('assets/Loadingemo.gif'),
                                image: NetworkImage(
                                    listaProveedores[index].imagen),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          color: Color.fromARGB(184, 29, 173, 29),
                          child: ListTile(
                            leading: Icon(Icons.card_giftcard),
                            title: Text(
                              listaProveedores[index].producto,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(184, 28, 30, 30),
                              ),
                            ),
                            subtitle: Text(
                              listaProveedores[index].fecha,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 30, 30, 33)),
                            ),
                            trailing: const Icon(Icons.arrow_right),
                            onTap: () {
                              Navigator.pushNamed(context, 'proveedores_form',
                                  arguments: listaProveedores[index]);
                            },
                          ),
                        )
                      ],
                    ),
                  ));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          agregarProveedoresItem();
        },
        backgroundColor: Colors.red[400],
      ),
    );
  }

  void agregarProveedoresItem() {
    Navigator.pushNamed(context, 'proveedores_form');
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.lightBlueAccent,
              offset: Offset(0, 10),
              blurRadius: 10)
        ]);
