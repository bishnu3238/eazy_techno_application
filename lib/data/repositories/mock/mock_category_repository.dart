// import 'package:biocellar/data/model/category_json.dart';
// import 'package:biocellar/domain/entities/categories.dart';
// import 'package:biocellar/domain/failures/category_fetch_failure.dart';
// import 'package:biocellar/domain/repositories/category_repository.dart';
// import 'package:biocellar/main.dart';
// import 'package:dartz/dartz.dart';
//
// class MockCategoryRepository implements CategoryRepository {
//   @override
//   Future<Either<CategoryFetchFailure, List<Categories>>> fetchCategory() async {
//     List<Categories> categoryList = List.generate(
//         10,
//         (index) => CategoryJson(
//                 id: '$index',
//                 categoryName: faker.company.name(),
//                 image: faker.image.image(),
//                 status: '1',
//                 time: faker.date.time(),
//                 date: DateTime.now().toString())
//             .toDomain()).toList();
//     return right(categoryList);
//   }
// }
