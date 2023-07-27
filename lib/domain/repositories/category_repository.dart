import 'package:dartz/dartz.dart';
import '../entities/categories.dart';
import '../failures/category_fetch_failure.dart';

abstract class CategoryRepository{

  Future<Either<CategoryFetchFailure, List<Categories>>> fetchCategory();

  List<Categories> getCategory() ;
}