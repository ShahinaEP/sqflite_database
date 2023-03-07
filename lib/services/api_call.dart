
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sqlife_database/model/profile_model.dart';

import '../model/product_model.dart';

class ProductRepository {
  Future<List<ProductModel>?> getProduct() async {
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/"));

    if (response.statusCode == 200) {
      var jsondata = response.body;
      // getProfile();
      return productModelFromJson(jsondata);
    } else {
      throw Exception("Something Went Wrong");
    }
  }

  Future<ProfliteListModel>getProfile() async {
    var response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

    if (response.statusCode == 200) {
      var jsondata = response.body;
      // var data = json.decode(response2.body);
      print("RESPONSE---$jsondata");

      return profliteListModelFromJson(jsondata);
    } else {
      throw Exception("Something Went Wrong");
    }
  }
}
