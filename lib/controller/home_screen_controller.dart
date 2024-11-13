import 'package:flutter/material.dart';
import 'package:ufs_task/model/product_model.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  bool isloading = false;
  List<ProductResModel> plist = [];
  Future<void> fetchproducts() async {
    isloading = true;
    notifyListeners();
    try {
      final Response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));

      if (Response.statusCode == 200) {
        var res = productResModelFromJson(Response.body);
        plist = res;
      }
    } catch (e) {
      print(e);
    }
    isloading = false;
    notifyListeners();
  }

  Future<void> detailproducts() async {
    notifyListeners();
    try {
      final Response =
          await http.get(Uri.parse("https://fakestoreapi.com/products/1"));

      if (Response.statusCode == 200) {
        var res = productResModelFromJson(Response.body);
        plist = res;
      }
    } catch (e) {
      print(e);
    }
    isloading = false;
    notifyListeners();
  }
}
