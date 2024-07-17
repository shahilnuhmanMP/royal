import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royal_class_app/modules/home/riverpod/provider/product_provider.dart';
import 'package:royal_class_app/modules/home/widget/shimmering_category.dart';
import 'package:royal_class_app/modules/home/widget/shimmering_product.dart';
import 'package:royal_class_app/support/app_theme.dart';
import 'package:royal_class_app/modules/home/riverpod/provider/category_provider.dart';
import 'package:royal_class_app/modules/home/widget/category_widget.dart';
import 'package:royal_class_app/modules/home/widget/product_widget.dart';
import 'package:royal_class_app/support/common_widget/bottom_nav_bar_widget.dart';
import 'package:royal_class_app/support/transition.dart';
import 'dart:math' as math;

class HomeScreenPage extends ConsumerWidget {
  const HomeScreenPage({super.key});

  static Route route() {
    return AppFadeTransition(page: const HomeScreenPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<int> selectedCategoryIndex = ValueNotifier(0);
    var categoryList = ref.watch(categoryProvider);
    var productList = ref.watch(productProvider);

    return Stack(
      children: [
        Container(
          color: colors(context).background,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset("assets/images/BG.png")),
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
              )
            ],
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              title: Text(
                "Choose your Bike",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: colors(context).text,
                        fontWeight: FontWeight.w700)),
              ),
              actions: [SearchWidget()],
            ),
          ),
          bottomNavigationBar: BottomNavigation(activeIcon: "cycle"),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.6,
                          child: Image.asset(
                            "assets/images/topCard.png",
                            fit: BoxFit.contain,
                            width: double.infinity,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Center(
                                child: Image.asset(
                                  "assets/images/cycleImage.png",
                                  height: 100,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, bottom: 40),
                              child: Text(
                                "30% off",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Section title: Categories

                  // Category list widget
                  ValueListenableBuilder(
                      valueListenable: selectedCategoryIndex,
                      builder: (context, val, child) {
                        return Transform.rotate(
                          angle: -math.pi / 20,
                          child: categoryList.when(data: (data) {
                            return CategoryListWidget(
                              categoryIndex: selectedCategoryIndex,
                              categoryListP: data,
                            );
                          }, error: (e, s) {
                            return SizedBox();
                          }, loading: () {
                            return ShimmeringCategory();
                          }),
                        );
                      }),

                  Padding(
                      padding: const EdgeInsets.only(top: 0, left: 0),
                      child: productList.when(data: (products) {
                        return ProductListWidget(
                          productlist: products,
                        );
                      }, error: (e, s) {
                        return SizedBox();
                      }, loading: () {
                        return ShimmerProductWidget();
                      }))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      padding: EdgeInsets.all(11),
      margin: EdgeInsets.only(right: 10),
      child: Image.asset(
        "assets/images/search.png",
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF34C8E8),
            Color(0xFF4E4AF2),
          ],
          stops: [0.0, 1.0],
        ),
      ),
    );
  }
}
