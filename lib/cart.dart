import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flutter_bloc/bloc/cart_bloc.dart';
import 'package:flutter_flutter_bloc/main.dart';

import 'bloc/cart_provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}


class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: StreamBuilder(
        stream: cartBloc.cartList,
        builder: (context, snapshot) {
          var sum = 0;
          if(snapshot.data!=null){
            if(snapshot.data!.length > 0){
              sum = snapshot.data!.map((item) => item.price).reduce((value, element) => value + element);
            }
          }
          return Center(
            child: Text(
              '합계 : $sum',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          );
        },
      )
    );
  }
}
