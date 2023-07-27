import 'package:bloc/bloc.dart';
import 'package:eazy_techno_application/domain/entities/entities.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class OfferTemplateStore extends Cubit<List<OfferTemplate>>   {
  OfferTemplateStore(): super([OfferTemplate.empty()]);


  void setOfferTemplate(List<OfferTemplate> offerTemplate) => emit(offerTemplate);



}