import 'package:dartz/dartz.dart';
import '../entities/items.dart';
import '../failures/item_fetch_failure.dart';

abstract class ItemRepository {
  Future<Either<ItemFetchFailure, List<Items>>> fetchItems();

  List<Items> getBestSellerItems();

  List<Items> getItems() ;

}
