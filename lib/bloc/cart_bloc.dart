

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flutter_bloc/item.dart';
import 'package:rxdart/rxdart.dart';
enum CartEventType{
  add, remove
}

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}

class CartBloc extends Bloc<CartEvent,List<Item>>{

  CartBloc() : super([]);

  final itemList = [
    Item('맥북1', 10000),
    Item('맥북2', 20000),
    Item('맥북3', 30000),
    Item('맥북4', 40000),
    Item('맥북5', 50000),
  ];

  final _cartList = List<Item>.empty(growable : true);

  final _cartListSubject = BehaviorSubject<List<Item>>.seeded([]);

  Stream<List<Item>> get cartList => _cartListSubject.stream;

  void add(CartEvent event){
    switch(event.type) {
      case CartEventType.remove:
        _cartList.remove(event.item);
        break;
      case CartEventType.add:
        _cartList.add(event.item);
        break;
    }
    _cartListSubject.add(_cartList);
  }

}