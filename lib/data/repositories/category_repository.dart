import 'package:dartz/dartz.dart';
import '../../app_constants/api_constant.dart';

import '../../domain/entities/categories.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/repository.dart';
import '../../domain/stores/store.dart';
import '../../package/package/package.dart';
import '../model/category_json.dart';

class BiocellarCategoryRepository implements CategoryRepository {
  final NetworkService _networkService;
  final CategoryStore categoryStore;

  BiocellarCategoryRepository(this._networkService, this.categoryStore);

  @override
  Future<Either<CategoryFetchFailure, List<Categories>>> fetchCategory() =>
      _networkService.get('$fetchTable$params1=category_master').then(
            (value) => value.fold(
              (l) => left(CategoryFetchFailure(l.error)),
              (r) {
                List categoryList = r['Data'] as List;
                List<Categories> categories = categoryList
                    .map((e) => CategoryJson.fromJson(e).toDomain())
                    .toList();
                categoryStore.setCategory(categories);
                return right(categories);
              },
            ),
          );

  @override
  List<Categories> getCategory() =>categoryStore.state;
}
