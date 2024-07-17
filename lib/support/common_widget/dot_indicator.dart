import 'package:flutter/material.dart';
import 'package:royal_class_app/support/app_theme.dart';

class DotIndicator extends StatelessWidget {
  final int pageIndex;
  final double height;
  final double width;
  final double activeWidth;
  final int? length;
  const DotIndicator(
      {super.key,
      required this.pageIndex,
      this.height = 5,
      this.width = 5,
      this.activeWidth = 30,
      this.length = 3});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Container(
            height: height,
            width: pageIndex == i ? activeWidth : width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: pageIndex == i
                  ? Colors.white
                  : colors(context).text!.withOpacity(0.5),
            ),
          );
        },
        separatorBuilder: (context, i) {
          return const SizedBox(
            width: 4,
          );
        },
        itemCount: length!,
      ),
    );
  }
}
