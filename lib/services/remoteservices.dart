import 'package:getx_api_calling/model/product.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Welcome>?> fetchProducts() async {
    Uri url =
        Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json');
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return welcomeFromJson(jsonString);
    } else {
      return null;
    }
  }
}
