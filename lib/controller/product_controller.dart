import 'package:get/get.dart';
import 'package:sqlife_database/database/database_helper.dart';
import 'package:sqlife_database/model/product_model.dart';
import 'package:sqlife_database/services/api_call.dart';

import '../model/profile_model.dart';

class ProductController extends GetxController {
  var loader = false.obs;

  var allProductList = RxList<ProductModel>().obs;
  var allProfileList = RxList<ProfliteListModel>().obs;

  final ProductRepository _productRepository = ProductRepository();
   DbHelper dbHelper = DbHelper();





   getData() async {
    loader.value = true;
    var apiData = await _productRepository.getProduct();
    print("Controller Response  Id ___${apiData!.length}");
    if (apiData != null) {
      allProductList.value.addAll(apiData);
      for (var element in allProductList.value) {
        DbHelper().createEmployee(element);
      }
      loader.value = false;
    }
  }

  getProfileData() async {
    loader.value = true;
    var apiData = await _productRepository.getProfile();
    // print("Controller Response  Id ___${apiData!.length}");
    if (apiData != null) {
      allProfileList.value.add(apiData);
      // for (var element in allProfileList.value) {
        DbHelper().createProfile(apiData);
      // }
      loader.value = false;
    }
  }
}
