import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
    required this.pageIndex,
    required this.images,
  });

  final ValueNotifier<int> pageIndex;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Image.network(images[index], height: 200,
                errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/images/cart.png',
                fit: BoxFit.cover,
                height: 200,
              );
            }));
      },
      options: CarouselOptions(
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 10),
        // aspectRatio: 2.5,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          pageIndex.value = index;
        },
      ),
    );
  }
}
