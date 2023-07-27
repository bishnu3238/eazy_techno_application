
import 'package:dartz/dartz.dart';
import '../../app_constants/api_constant.dart';

import '../../domain/entities/brands.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/repository.dart';
import '../../domain/stores/store.dart';
import '../../package/package/package.dart';
import '../model/brand_json.dart';


class BiocellarBrandRepository implements BrandRepository {
  final NetworkService _networkService;

  final BrandStore brandStore;
  BiocellarBrandRepository(this._networkService, this.brandStore);

  @override
  Future<Either<BrandFetchFailure, List<Brands>>> fetchBrand() =>
      _networkService.get('$fetchTable$params1=subcategory_master').then(
            (value) => value.fold(
              (l) => left(BrandFetchFailure(l.error)),
              (r) {
                List brandList = r['Data'] as List;
                List<Brands> brands = brandList
                    .map((e) => BrandJson.fromMap(e).toDomain())
                    .toList();
                brandStore.setBrands(brands);
                return right(brands);
              },
            ),
          );

  @override
  List<Brands> getBrands()=> brandStore.state;

}
