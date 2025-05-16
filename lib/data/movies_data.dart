import 'dart:convert';

import 'package:hazyna_doner/list_screen.dart';
import 'package:hazyna_doner/model/services_model.dart';

class Movie {
  final String name;
  final String phone;
  final String image;
  bool isBookmarked;

  Movie({
    required this.name,
    required this.phone,
    required this.image,
    this.isBookmarked = false,
  });


  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      name: json['name'],
      phone: json['phone'],
      image: json['image'],
      isBookmarked: json['isBookmarked'] ?? false,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'image': image,
      'isBookmarked': isBookmarked,
    };
  }


  void toggleBookmark() {
    isBookmarked = !isBookmarked;
  }
}

class DataService {
  static List<ServicesModel> getCities() {
    final data = jsonDecode(categoriesJson);
    return (data as List).map((e) => ServicesModel.fromJson(e)).toList();
  }
}
