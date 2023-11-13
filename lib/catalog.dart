import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flutter_bloc/bloc/cart_bloc.dart';
import 'package:flutter_flutter_bloc/bloc/cart_provider.dart';
import 'package:flutter_flutter_bloc/main.dart';

import 'cart.dart';
import 'item.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = CartProvider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Catalog'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart()),
                );
              },
              icon: Icon(Icons.archive),
            )
          ],
        ),
        body: StreamBuilder(
          stream: cartBloc.cartList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: cartBloc.itemList
                    .map((e) => _buildItem(e, snapshot.data!, cartBloc))
                    .toList(),
              );
            } else {
              return Container();
            }
          },
        ));
  }

  Widget _buildItem(
    Item item,
    List<Item> state,
    CartBloc cartBloc,
  ) {
    final isChecked = state.contains(item);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          item.title,
          style: TextStyle(fontSize: 31.0),
        ),
        subtitle: Text('${item.price}'),
        trailing: IconButton(
          onPressed: () {
            if (isChecked) {
              cartBloc.add(CartEvent(CartEventType.remove, item));
            } else {
              cartBloc.add(CartEvent(CartEventType.add, item));
            }
          },
          icon: isChecked
              ? Icon(
                  Icons.check,
                  color: Colors.red,
                )
              : Icon(Icons.check),
        ),
      ),
    );
  }
}
