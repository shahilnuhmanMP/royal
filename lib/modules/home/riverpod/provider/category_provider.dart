import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:royal_class_app/modules/home/model/category.dart';
import 'package:royal_class_app/modules/home/repository/category_repository.dart';
import 'package:royal_class_app/modules/home/riverpod/notifier/category_notifier.dart';

final categoryRepoProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository();
});

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, AsyncValue<List<CategoryModel>>>(
        (ref) {
  return CategoryNotifier(ref.watch(categoryRepoProvider));
});
