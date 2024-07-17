// Importing necessary libraries and models

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:royal_class_app/modules/home/model/category.dart';
import 'package:royal_class_app/modules/home/repository/category_repository.dart';

// BannerNotifier class responsible for managing banner data state
class CategoryNotifier extends StateNotifier<AsyncValue<List<CategoryModel>>> {
  final CategoryRepository _categoryRepo;

  // Constructor for BannerNotifier
  CategoryNotifier(this._categoryRepo) : super(const AsyncValue.loading()) {
    fetchCategories(); // Automatically fetch banners upon initialization
  }

  // Method to fetch banners asynchronously
  Future<void> fetchCategories() async {
    try {
      // Call the listBanners method from BannerRepository to fetch banners
      final categories = await _categoryRepo.listCategories();
      // Set state to represent successful data retrieval
      state = AsyncValue.data(categories);
    } on Exception catch (e, st) {
      // Set state to represent error in case of any exception during fetching
      state = AsyncValue.error(e, st);
    }
  }
}
