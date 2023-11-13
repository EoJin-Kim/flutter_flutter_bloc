

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flutter_bloc/item.dart';
enum CartEventType{
  add, remove
}

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}

class CartBloc extends Bloc<CartEvent,List<Item>>{


  CartBloc() : super([]){
    on<CartEvent>((event, emit) {
      switch (event.type){
        case CartEventType.add:
          state.add(event.item);
          break;
        case CartEventType.remove:
          state.remove(event.item);
          break;
      }
      emit(state);
    });
  }

}