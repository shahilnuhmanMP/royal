import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royal_class_app/modules/home/model/product.dart';
import 'package:royal_class_app/support/app_theme.dart';
import 'dart:math' as math;

class ShimmerProductWidget extends StatelessWidget {
  const ShimmerProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: (MediaQuery.of(context).size.width) /
          (MediaQuery.of(context).size.width) *
          0.7,
      children: List.generate(10, (index) {
        return GestureDetector(
          onTap: () {},
          child: Transform.rotate(
            angle: -math.pi / 1000,
            child: Container(
              margin: EdgeInsets.only(
                  top: index % 2 == 0 ? 30 : 0,
                  bottom: index % 2 == 0 ? 0 : 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/product_shape.png",
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
