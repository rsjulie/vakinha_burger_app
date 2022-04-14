import 'dart:convert';

class OrderPixModel {
  String image;
  String code;
  double totalValue;

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

  OrderPixModel copyWith({
    String? image,
    String? code,
    double? totalValue,
  }) {
    return OrderPixModel(
        image: image ?? this.image,
        code: code ?? this.code,
        totalValue: totalValue ?? this.totalValue);
  }
}
