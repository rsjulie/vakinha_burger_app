import 'dart:convert';

class OrderPixModel {
  String image;
  String code;
  String totalValue;

  OrderPixModel({
    required this.image,
    required this.code,
    required this.totalValue,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'code': code,
      'totalValue': totalValue,
    };
  }

  factory OrderPixModel.fromMap(Map<String, dynamic> map) {
    return OrderPixModel(
      image: map['image'] ?? '',
      code: map['code'] ?? '',
      totalValue: map['totalValue'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderPixModel.fromJson(String source) =>
      OrderPixModel.fromMap(json.decode(source));
}
