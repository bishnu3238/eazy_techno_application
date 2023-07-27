import 'package:equatable/equatable.dart';

class OfferTemplate extends Equatable {
  final String id;
  final String offerTemplate;
  final String status;

  const OfferTemplate({
    required this.id,
    required this.offerTemplate,
    required this.status,
  });

  factory OfferTemplate.empty() => const OfferTemplate(
        id: '',
        offerTemplate: '',
        status: '',
      );

  OfferTemplate copyWith({
    String? id,
    String? offerTemplate,
    String? status,
  }) =>
      OfferTemplate(
        id: id ?? this.id,
        offerTemplate: offerTemplate ?? this.offerTemplate,
        status: status ?? this.status,
      );
  @override
  List<Object?> get props => [id, offerTemplate, status];
}
