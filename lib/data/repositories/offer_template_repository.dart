import 'package:dartz/dartz.dart';
import 'package:eazy_techno_application/data/model/offer_template_json.dart';
import 'package:eazy_techno_application/domain/entities/offer_template.dart';
import 'package:eazy_techno_application/domain/failures/offer_template_fetch_failure.dart';
import 'package:eazy_techno_application/domain/repositories/repository.dart';

import '../../app_constants/app_constant.dart';
import '../../domain/stores/store.dart';
import '../../package/package/package.dart';

class PhpMyAdminOfferTemplateRepository implements OfferTemplateRepository {
  final NetworkService _networkService;
  final OfferTemplateStore offerTemplateStore;

  PhpMyAdminOfferTemplateRepository(this._networkService, this.offerTemplateStore);

  @override
  Future<Either<OfferTemplateFetchFailure, List<OfferTemplate>>>
      fetchOfferTemplate() async =>
          _networkService.get('$fetchTable$params1=category_master').then(
                (value) => value.fold(
                  (l) => left(OfferTemplateFetchFailure(l.error)),
                  (r) {
                    List list = r['Data'] as List;
                    List<OfferTemplate> offerTemplateList = list
                        .map((e) => OfferTemplateJson.fromJson(e).toDomain())
                        .toList();
                    offerTemplateStore.setOfferTemplate(offerTemplateList);
                    return right(offerTemplateList);
                  },
                ),
              );
}
