import 'package:dartz/dartz.dart';
import '../../app_constants/api_constant.dart';

import '../../domain/entities/items.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/repository.dart';
import '../../domain/stores/store.dart';
import '../../package/package/package.dart';
import '../model/item_json.dart';

class BiocellarItemRepository implements ItemRepository {
  final NetworkService _networkService;
  final ItemsStore itemsStore;

  BiocellarItemRepository(this._networkService, this.itemsStore);

  @override
  Future<Either<ItemFetchFailure, List<Items>>> fetchItems() =>
      _networkService.get('$fetchTable$params1=menu_master').then(
            (value) => value.fold(
              (l) => left(ItemFetchFailure(l.error)),
              (r) {
                List itemList = r['Data'] as List;

                List<Items> items = itemList
                    .map((e) => ItemsJson.fromJson(e).toDomain())
                    .toList();
                itemsStore.setItems(items);
                return right(items);
              },
            ),
          );

  @override
  List<Items> getBestSellerItems() =>
      itemsStore.state.where((element) => element.bestSeller == "1").toList();

  @override
  List<Items> getItems() => itemsStore.state;
}
