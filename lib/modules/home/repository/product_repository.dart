import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_class_app/modules/home/model/product.dart';

class ProductRepository {
  Future<List<Product>> listProducts() async {
    List<Product> products = [];

    try {
      var url = Uri.parse("https://api.escuelajs.co/api/v1/products");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        products = jsonResponse
            .map((item) => Product.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        print('Failed to load categories: ${response.statusCode}');
      }
    } catch (error) {
      print('Server Error: $error');
    }
    // print(categories);
    return products;
  }
}
