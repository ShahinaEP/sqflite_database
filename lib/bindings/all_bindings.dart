  import 'package:get/get.dart';
import 'package:sqlife_database/controller/product_controller.dart';

class Allbindings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => ProductController());
  }

}