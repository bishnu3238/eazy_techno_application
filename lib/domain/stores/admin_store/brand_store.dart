import 'package:flutter_bloc/flutter_bloc.dart';
import '../../entities/brands.dart';

class BrandStore extends Cubit<List<Brands>> {
  BrandStore() : super([Brands.empty()]);

  void setBrands(List<Brands> brands) => emit(brands);
}
