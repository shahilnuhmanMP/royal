import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:royal_class_app/modules/home/model/product.dart';
import 'package:royal_class_app/modules/home/repository/product_repository.dart';
import 'package:royal_class_app/modules/home/riverpod/notifier/product_notifier.dart';

// Provider for BannerRepository instance
final productRepoProvider = Provider<ProductRepository>((ref) {
  // Return an instance of BannerRepository
  return ProductRepository();
});

// StateNotifierProvider for managing banner state
final productProvider =
    StateNotifierProvider<ProductNotifier, AsyncValue<List<Product>>>((ref) {
  // Return an instance of BannerNotifier with BannerRepository dependency injected
  return ProductNotifier(ref.watch(productRepoProvider));
});
