import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/screens/add_product_screen.dart';
import 'package:shopping_app/widgets/app_drawer.dart';
import 'package:shopping_app/widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = 'user-product-screen';
  Future<void> _refreshedProduct(BuildContext ctx) async {
    await Provider.of<Products>(ctx, listen: false).getProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Products'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddProductScreen.routeName);
              },
            )
          ],
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          future: _refreshedProduct(context),
          builder: (ctx, snapShot) =>
              snapShot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      onRefresh: () => _refreshedProduct(context),
                      child: Consumer<Products>(
                        builder: (context, prodData, child) => Padding(
                            padding: EdgeInsets.all(8),
                            child: ListView.builder(
                              itemCount: prodData.items.length,
                              itemBuilder: (ctx, i) => UserProductItem(
                                  prodData.items[i].id,
                                  prodData.items[i].title,
                                  prodData.items[i].imageUrl),
                            )),
                      ),
                    ),
        ));
  }
}
