import 'package:flutter_bloc/flutter_bloc.dart';

import '../../entities/items.dart';

class ItemsStore extends Cubit<List<Items>> {
  ItemsStore() : super([Items.empty()]);

  void setItems(List<Items> items) => emit(items);
}
