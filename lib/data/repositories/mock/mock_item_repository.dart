// import 'package:biocellar/data/model/item_json.dart';
// import 'package:biocellar/domain/entities/items.dart';
// import 'package:biocellar/domain/failures/item_fetch_failure.dart';
// import 'package:biocellar/domain/repositories/item_repository.dart';
// import 'package:biocellar/main.dart';
// import 'package:dartz/dartz.dart';
// import 'dart:math' as math show Random;
//
// import '../../../domain/store/admin_store/brand_store.dart';
// import '../../../domain/store/admin_store/category_store.dart';
//
// class MockItemRepository implements ItemRepository {
//   CategoryStore categoryStore;
//   BrandStore brandStore;
//
//   MockItemRepository({required this.categoryStore, required this.brandStore});
//
//   @override
//   Future<Either<ItemFetchFailure, List<Items>>> fetchItems() async {
//     var random = math.Random();
//
//     return Future.delayed(
//       const Duration(seconds: 1),
//       () {
//         List<Items> brandList = List.generate(
//             100,
//             (index) => ItemsJson(
//                     id: '$index',
//                     menuName: faker.job.title(),
//                     categoryId: categoryStore
//                         .state[(random.nextInt(categoryStore.state.length))].id,
//                     subCategoryId: brandStore
//                         .state[(random.nextInt(brandStore.state.length))].id,
//                     title: faker.lorem.word(),
//                     subTitle: faker.lorem.sentence(),
//                     description: faker.lorem.random.toString(),
//                     price: random.nextInt(50000).toString(),
//                     quantity: random.nextInt(50).toString(),
//                     discount: random.nextInt(50).toString(),
//                     finalPrice: random.nextInt(50000).toString(),
//                     image: faker.image.image(),
//                     bestSeller: index.isOdd ? '1' : '0',
//                     rating: faker.randomGenerator
//                         .decimal(min: 0, scale: 5)
//                         .toString(),
//                     offerPeriod: faker.randomGenerator.string(20),
//                     status: '1',
//                     time: faker.date.time(),
//                     date: DateTime.now().toString())
//                 .toDomain()).toList();
//         return right(brandList);
//       },
//     );
//   }
// }
