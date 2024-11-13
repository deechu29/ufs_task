// To parse this JSON data, do
//
//     final detailProductResModel = detailProductResModelFromJson(jsonString);

import 'dart:convert';

DetailProductResModel detailProductResModelFromJson(String str) =>
    DetailProductResModel.fromJson(json.decode(str));

String detailProductResModelToJson(DetailProductResModel data) =>
    json.encode(data.toJson());

class DetailProductResModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  DetailProductResModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory DetailProductResModel.fromJson(Map<String, dynamic> json) =>
      DetailProductResModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
      };
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
