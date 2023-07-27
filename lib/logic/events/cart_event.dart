import 'package:eazy_techno_application/domain/entities/cart_item.dart';

abstract class CartEvent{
  CartEvent();
}


class AddToCart extends CartEvent{
  final  CartItem cartItem;
  AddToCart(this.cartItem);
}

class RemoveFromCart extends CartEvent{
  final String id;
  RemoveFromCart(this.id);

}

class DecrementCartItem extends CartEvent{

  String id;
  DecrementCartItem(this.id);


}

class IncrementCartItem extends CartEvent{
  String id;
  IncrementCartItem(this.id);
}
