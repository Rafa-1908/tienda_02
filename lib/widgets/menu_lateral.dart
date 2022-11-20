import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          const DrawerHeader(
            child: Text('INICIO'),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bakerylogo.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: const Icon(Icons.bakery_dining),
            title: Text('Principal'),
            onTap: () {
              Navigator.pushNamed(context, 'principal');
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_home),
            title: Text('Productos'),
            onTap: (() {
              Navigator.pushNamed(context, 'productos');
            }),
          ),
          ListTile(
            leading: const Icon(Icons.work),
            title: Text('Trabajadores'),
            onTap: (() {
              Navigator.pushNamed(context, 'trabajadores');
            }),
          ),
          ListTile(
            leading: const Icon(Icons.local_shipping),
            title: Text('Proveedores'),
            onTap: (() {
              Navigator.pushNamed(context, 'proveedores');
            }),
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: Text('Verduras'),
            onTap: (() {
              Navigator.pushNamed(context, 'verduras');
            }),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: Text('Clientes'),
            onTap: (() {
              Navigator.pushNamed(context, 'clientes');
            }),
          ),
          ListTile(
            leading: const Icon(Icons.equalizer),
            title: Text('Reportes'),
            onTap: (() {
              Navigator.pushNamed(context, 'reportes');
            }),
          ),
          ListTile(
            leading: const Icon(Icons.equalizer),
            title: Text('Reportes Proveedores'),
            onTap: (() {
              Navigator.pushNamed(context, 'reportes_proveedores');
            }),
          ),
          ListTile(
            leading: const Icon(Icons.equalizer),
            title: Text('Reportes Clientes'),
            onTap: (() {
              Navigator.pushNamed(context, 'reportes_clientes');
            }),
          ),
          ListTile(
            leading: const Icon(Icons.equalizer),
            title: Text('Reportes Trabajadores'),
            onTap: (() {
              Navigator.pushNamed(context, 'reportes_trabajadores');
            }),
          ),
        ],
      ),
    );
  }
}
