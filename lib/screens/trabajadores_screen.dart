import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_02/models/trabajadores.dart';
import 'package:tienda_02/models/trabajadores_local.dart';
import 'package:tienda_02/providers/trabajadores_provider.dart';
import 'package:tienda_02/widgets/menu_lateral.dart';

class TrabajadoresScreen extends StatefulWidget {
  const TrabajadoresScreen({super.key});

  @override
  State<TrabajadoresScreen> createState() => _TrabajadoresScreenState();
}

class _TrabajadoresScreenState extends State<TrabajadoresScreen> {
  @override
  Widget build(BuildContext context) {
    final trabajadoresProvider = Provider.of<TrabajadoresProvider>(context);
    final List<Trabajadores> listaTrabajadores =
        trabajadoresProvider.listaTrabajadores;

    return Scaffold(
      appBar: AppBar(
        title: const Text('TRABAJADORES'),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: ListView.builder(
            itemCount: listaTrabajadores.length,
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
                                    listaTrabajadores[index].imagen),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          color: Color.fromARGB(184, 143, 108, 78),
                          child: ListTile(
                            leading: Icon(Icons.card_giftcard),
                            title: Text(
                              listaTrabajadores[index].nombre,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(184, 29, 31, 30),
                              ),
                            ),
                            subtitle: Text(
                              listaTrabajadores[index].fecha,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            trailing: const Icon(Icons.arrow_right),
                            onTap: () {
                              Navigator.pushNamed(context, 'trabajadores_form',
                                  arguments: listaTrabajadores[index]);
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
          agregarTrabajadoresItem();
        },
        backgroundColor: Color.fromARGB(255, 10, 112, 41),
      ),
    );
  }

  void agregarTrabajadoresItem() {
    Navigator.pushNamed(context, 'trabajadores_form');
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 144, 255, 64),
              offset: Offset(0, 10),
              blurRadius: 10)
        ]);
