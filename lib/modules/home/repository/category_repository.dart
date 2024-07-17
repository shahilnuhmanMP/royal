import 'dart:convert';

import 'package:royal_class_app/modules/home/model/category.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  Future<List<CategoryModel>> listCategories() async {
    List<CategoryModel> categories = [];

    try {
      var url = Uri.parse("https://api.escuelajs.co/api/v1/categories");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        categories = jsonResponse
            .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        print('Failed to load categories: ${response.statusCode}');
      }
    } catch (error) {
      print('Server Error: $error');
    }
    // print(categories);
    return categories;
  }
}
