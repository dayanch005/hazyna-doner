import 'package:flutter/material.dart';
import 'package:hazyna_doner/model/services_model.dart';
import 'package:hive/hive.dart';

class ShoppingProvider extends ChangeNotifier {
  List<ItemItem> favorite = [];

  ShoppingProvider() {
    getHive();
  }

  List<ItemItem> get favouriteMovies => favorite;

  void getHive() {
    var box = Hive.box('moviesBox');
    List<dynamic> bazadan = box.get("product", defaultValue: []);
    if (bazadan.isNotEmpty) {
      favorite = List<ItemItem>.from(bazadan.cast<ItemItem>());
    }
  }

  void addToFavourites(ItemItem movie) {
    if (!isFavourite(movie)) {
      favorite.add(movie);
      Hive.box("moviesBox").put("product", favorite);
      notifyListeners();
    }
  }

  void removeFromFavourites(ItemItem movie) {
    favorite.removeWhere((element) => element.name == movie.name);
    Hive.box("moviesBox").put("product", favorite);
    notifyListeners();
  }

  bool isFavourite(ItemItem movie) {
    return favorite.any((element) => element.name == movie.name);
  }
}
