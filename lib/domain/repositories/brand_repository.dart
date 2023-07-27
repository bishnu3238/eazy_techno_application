import 'package:dartz/dartz.dart';

import '../entities/brands.dart';
import '../failures/brand_fetch_failure.dart';


abstract class BrandRepository{
  Future<Either<BrandFetchFailure, List<Brands>>> fetchBrand();
  List<Brands> getBrands();
}