/*


import 'package:dartz/dartz.dart';

import '../../../domain/entities/brands.dart';
import '../../../domain/failures/failure.dart';
import '../../../domain/repositories/repository.dart';
import '../../../main.dart';
import '../../model/brand_json.dart';

class MockBrandRepository implements BrandRepository {
  @override
  Future<Either<BrandFetchFailure, List<Brands>>> fetchBrand() async {
    List<Brands> brandList = List.generate(
        10,
        (index) => BrandJson(
                id: '$index',
                brandName: faker.company.name(),
                image: faker.image.image(),
                status: '1',
                time: faker.date.time(),
                date: DateTime.now().toString())
            .toDomain()).toList();
    return right(brandList);
  }
}
*/
