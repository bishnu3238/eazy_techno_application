import 'package:equatable/equatable.dart';

import 'entities.dart';

class CartItem extends Equatable {
  final Items cartItem;
  final int orderItemQuantity;

  const CartItem({
    required this.cartItem,
    required this.orderItemQuantity,
  });

  factory CartItem.empty() =>
      CartItem(cartItem: Items.empty(), orderItemQuantity: 0);

  CartItem copyWith({
    Items? cartItem,
    int? orderItemQuantity,
  }) =>
      CartItem(
        cartItem: cartItem ?? this.cartItem,
        orderItemQuantity: orderItemQuantity ?? this.orderItemQuantity,
      );

  @override
  List<Object?> get props => [cartItem, orderItemQuantity];
}
