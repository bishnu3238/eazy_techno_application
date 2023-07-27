import 'dart:async';

import 'package:eazy_techno_application/logic/states/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../events/events.dart';

class CartBloc extends Bloc<CartEvent, CartState>{
  CartBloc():super(CartInitialState()){
    on<AddToCart>(_addToCart);
    on<RemoveFromCart>((event, emit) => null);
    on<DecrementCartItem>((event, emit) => null);
    on<IncrementCartItem>((event, emit) => null);
  }

  FutureOr<void> _addToCart(AddToCart event, Emitter<CartState> emit) {



  }
}