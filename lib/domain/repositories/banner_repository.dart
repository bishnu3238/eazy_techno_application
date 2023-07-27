import 'package:dartz/dartz.dart';

import '../entities/banner.dart';
import '../failures/banner_fetch_failure.dart';

abstract class BannerRepository{
  Future<Either<BannerFetchFailure, List<Banners>>> fetchBanners();
  List<Banners> getBanner();
}