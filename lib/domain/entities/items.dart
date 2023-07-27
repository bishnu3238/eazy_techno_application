import 'package:eazy_techno_application/package/custom_widget/card_grid_view_tile.dart';
import 'package:equatable/equatable.dart';

class Items extends Equatable {
  final String id;
  final dynamic menuName;
  final String categoryId;
  final String subCategoryId;
  final String title;
  final String subTitle;
  final String description;
  final String price;
  final String quantity;
  final String discount;
  final String finalPrice;
  final String image;
  final String bestSeller;
  final String rating;
  final String offerPeriod;
  final String status;
  final String time;
  final DateTime date;

  Items({
    required this.id,
    required this.menuName,
    required this.categoryId,
    required this.subCategoryId,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.price,
    required this.quantity,
    required this.discount,
    required this.finalPrice,
    required this.image,
    required this.bestSeller,
    required this.rating,
    required this.offerPeriod,
    required this.status,
    required this.time,
    required this.date,
  });

  Items copyWith({
    String? id,
    dynamic menuName,
    String? categoryId,
    String? subCategoryId,
    String? title,
    String? subTitle,
    String? description,
    String? price,
    String? quantity,
    String? discount,
    String? finalPrice,
    String? image,
    String? bestSeller,
    String? rating,
    String? offerPeriod,
    String? status,
    String? time,
    DateTime? date,
  }) =>
      Items(
        id: id ?? this.id,
        menuName: menuName ?? this.menuName,
        categoryId: categoryId ?? this.categoryId,
        subCategoryId: subCategoryId ?? this.subCategoryId,
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,
        description: description ?? this.description,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        discount: discount ?? this.discount,
        finalPrice: finalPrice ?? this.finalPrice,
        image: image ?? this.image,
        bestSeller: bestSeller ?? this.bestSeller,
        rating: rating ?? this.rating,
        offerPeriod: offerPeriod ?? this.offerPeriod,
        status: status ?? this.status,
        time: time ?? this.time,
        date: date ?? this.date,
      );

  @override
  List<Object?> get props => [
        id,
        menuName,
        categoryId,
        subCategoryId,
        title,
        subTitle,
        description,
        price,
        quantity,
        discount,
        finalPrice,
        image,
        bestSeller,
        rating,
        offerPeriod,
        status,
        time,
        date
      ];

  factory Items.empty() => Items(
      id: '',
      menuName: '',
      categoryId: '',
      subCategoryId: '',
      title: '',
      subTitle: '',
      description: '',
      price: '',
      quantity: '',
      discount: '',
      finalPrice: '',
      image: '',
      bestSeller: '',
      rating: '',
      offerPeriod: '',
      status: '',
      time: '',
      date: DateTime.now());

  GridViewModel toGridViewModel() => GridViewModel(
      id: id,
      title: title,
      subTitle: subTitle,
      price: price,
      image: image,
      status: status);
}
