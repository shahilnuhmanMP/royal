import 'package:flutter/material.dart';
import 'package:royal_class_app/support/app_theme.dart';
import 'dart:math' as math;

import 'package:royal_class_app/support/constants.dart';

class ShimmeringCategory extends StatelessWidget {
  ShimmeringCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print(categoryList.length);
    return SizedBox(
        height: 70,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: List.generate(categoryList.length, (index) {
            return Transform.rotate(
              angle: math.pi / 20,
              child: Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: colors(context).shadowColor!,
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 10), // Shadow position, bottom
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF353F54), // #353F54
                      Color(0xFF222834), // #222834
                    ],
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(child: Container()),
              ),
            );
          }),
        ));
  }
}
