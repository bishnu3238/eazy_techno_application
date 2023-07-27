import '../../domain/entities/entities.dart';

class OfferTemplateJson {
  final String id;
  final String offerTemplate;
  final String status;

  const OfferTemplateJson({
    required this.id,
    required this.offerTemplate,
    required this.status,
  });

  factory OfferTemplateJson.fromJson(Map<String, dynamic> json) {
    return OfferTemplateJson(
      id: json['id'] as String,
      offerTemplate: json['offer_template'] as String,
      status: json['status'] as String,
    );
  }

  OfferTemplate toDomain() => OfferTemplate(
        id: id,
        offerTemplate: offerTemplate,
        status: status,
      );
}
