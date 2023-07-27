import '../../app_constants/api_constant.dart';
import '../../domain/entities/banner.dart';


class BannerJson {
  final String id;
  final String imagePath;
  final String status;

  const BannerJson({
    required this.id,
    required this.imagePath,
    required this.status,
  });

  factory BannerJson.fromMap(Map<String, dynamic> json) {
    return BannerJson(
      id: json['id'] as String,
      imagePath: json['image'] as String,
      status: json['status'] as String,
    );
  }

  Banners toDomain() => Banners(
        id: id,
        imagePath: '$bannerImgDir/${imagePath.split(".")[0]}/$imagePath',
        status: status,
      );
}
