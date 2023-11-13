import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flutter_bloc/bloc/cart_bloc.dart';

import 'cart.dart';
import 'item.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);
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
      body: BlocProvider(
        create: (context) => _cartBloc,
        child: BlocBuilder(
          bloc: _cartBloc,
          builder: (BuildContext context, List state) {
            return ListView(
              children: _itemList
                  .map((e) => _buildItem(e, state, _cartBloc))
                  .toList(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildItem(
    Item item,
    List state,
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
            setState(() {
              if(isChecked){
                cartBloc.add(CartEvent(CartEventType.remove, item));
              }else{
                cartBloc.add(CartEvent(CartEventType.add, item));
              }
            });
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
