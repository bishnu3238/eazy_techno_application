import '../../domain/entities/entities.dart';

abstract class CartState {
  List<CartItem> cartItem;
  CartState({required this.cartItem});
}

class CartInitialState extends CartState {
  CartInitialState() : super(cartItem: []);
}

class CartLoadingState extends CartState{
  CartLoadingState({required super.cartItem});

}
