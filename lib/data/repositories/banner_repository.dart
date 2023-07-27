import 'package:dartz/dartz.dart';

import '../../app_constants/api_constant.dart';
import '../../domain/entities/banner.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/repository.dart';

import '../../domain/stores/store.dart';
import '../../package/package/package.dart';
import '../model/banner_json.dart';

class BiocellarBannerRepository implements BannerRepository {
  final NetworkService _networkService;
  final BannerStore bannerStore;

  BiocellarBannerRepository(this._networkService, this.bannerStore);

  @override
  Future<Either<BannerFetchFailure, List<Banners>>> fetchBanners() =>
      _networkService.get('$fetchTable$params1=slider_master').then(
            (value) => value.fold(
              (l) => left(BannerFetchFailure(l.error)),
              (r) {
                List bannerList = r['Data'] as List;
                List<Banners> banner = bannerList
                    .map((e) => BannerJson.fromMap(e).toDomain())
                    .toList();
                bannerStore.setBanner(banner);
                return right(banner);
              },
            ),
          );

  @override
  List<Banners> getBanner() =>bannerStore.state;
}
