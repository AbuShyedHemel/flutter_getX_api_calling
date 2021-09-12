import 'package:get/state_manager.dart';
import 'package:getx_api_calling/model/product.dart';
import 'package:getx_api_calling/services/remoteservices.dart';

class ProductController extends GetxController {
  // ignore: deprecated_member_use
  var isLoading = true.obs;
  var productList = <Welcome>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      var products = await RemoteServices.fetchProducts();

      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
