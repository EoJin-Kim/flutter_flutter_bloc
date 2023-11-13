import 'package:flutter/widgets.dart';
import 'package:flutter_flutter_bloc/bloc/cart_bloc.dart';

class CartProvider extends InheritedWidget {
  final CartBloc cartBloc;

  CartProvider({
    super.key,
    CartBloc? cartBloc,
    required super.child,
  }) : cartBloc = cartBloc ?? CartBloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static CartBloc of(BuildContext context) => (context.dependOnInheritedWidgetOfExactType<CartProvider>() as CartProvider).cartBloc;
}
