// Importing necessary libraries and models

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:royal_class_app/modules/home/model/product.dart';
import 'package:royal_class_app/modules/home/repository/product_repository.dart';

// BannerNotifier class responsible for managing banner data state
class ProductNotifier extends StateNotifier<AsyncValue<List<Product>>> {
  final ProductRepository _productRepo;

  // Constructor for BannerNotifier
  ProductNotifier(this._productRepo) : super(const AsyncValue.loading()) {
    fetchProducts(); // Automatically fetch banners upon initialization
  }

  // Method to fetch banners asynchronously
  Future<void> fetchProducts() async {
    try {
      // Call the listBanners method from BannerRepository to fetch banners
      final banners = await _productRepo.listProducts();
      // Set state to represent successful data retrieval
      state = AsyncValue.data(banners);
    } on Exception catch (e, st) {
      // Set state to represent error in case of any exception during fetching
      state = AsyncValue.error(e, st);
    }
  }
}
