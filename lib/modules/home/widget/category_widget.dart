import 'package:flutter/material.dart';
import 'package:royal_class_app/support/app_theme.dart';
import 'package:royal_class_app/modules/home/model/category.dart';
import 'dart:math' as math;

class CategoryListWidget extends StatelessWidget {
  CategoryListWidget({
    super.key,
    required this.categoryIndex,
    required this.categoryListP,
  });

  ValueNotifier<int> categoryIndex;
  final List<CategoryModel> categoryListP;

  @override
  Widget build(BuildContext context) {
    print(categoryListP.length);
    return SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: List.generate(categoryListP.length, (index) {
            return GestureDetector(
              onTap: () {
                categoryIndex.value = index;
              },
              child: Transform.rotate(
                angle: math.pi / 20,
                child: Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: colors(context).shadowColor!.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 10), // Shadow position, bottom
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: categoryIndex.value == index
                          ? [
                              Color(0xFF34C8E8),
                              Color(0xFF4E4AF2),
                            ]
                          : [
                              Color(0xFF353F54), // #353F54
                              Color(0xFF222834), // #222834
                            ],
                      stops: [0.0, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: index == 0
                        ? Text(
                            "All",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: colors(context).text),
                          )
                        : Image.network(
                            categoryListP[index].image ?? "",
                            fit: BoxFit.fill,
                            height: 24,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/cart.png',
                                fit: BoxFit.fill,
                                height: 24,
                              );
                            },
                          ),
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
