import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flutter_bloc/bloc/cart_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocProvider(
        create: (context) => _cartBloc,
        child: BlocBuilder(
          bloc: _cartBloc,
          builder: (BuildContext context,List state) {
            var sum = 0;
            if(state.length > 0){
              sum = state.map((item) => item.price).reduce((value, element) => value + element);
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
        ),
      ),
    );
  }
}
