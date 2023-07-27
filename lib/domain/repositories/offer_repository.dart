import 'package:dartz/dartz.dart';
import '../entities/entities.dart';
import '../failures/failure.dart';

abstract class OfferTemplateRepository {
  Future<Either<OfferTemplateFetchFailure, List<OfferTemplate>>>
      fetchOfferTemplate();
}
