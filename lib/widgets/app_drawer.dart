import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/auth.dart';
import '../screens/orders_screen.dart';
import 'package:shopping_app/screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        AppBar(
          title: Text('Hello User'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Shop'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Orders'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Manage Products'),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(UserProductScreen.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('LogOut'),
          onTap: () {
            Navigator.of(context).pop();
            Provider.of<Auth>(context, listen: false).logout();
          },
        )
      ],
    ));
  }
}
