
import '../../entities/categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CategoryStore extends Cubit<List<Categories>>{
  CategoryStore():super([Categories.empty()]);




  void setCategory(List<Categories> categories) => emit(categories);

}