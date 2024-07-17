import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royal_class_app/modules/home/model/product.dart';
import 'package:royal_class_app/support/app_theme.dart';
import 'package:royal_class_app/modules/home/view/product_details_page.dart';
import 'dart:math' as math;

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    super.key,
    required this.productlist,
  });

  final List<Product> productlist;

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
      children: List.generate(productlist.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context, ProductDetailsPage.route(product: productlist[index]));
          },
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color:
                                      colors(context).primary!.withOpacity(0.2),
                                ),
                                child: Image.network(
                                    productlist[index].images?[0] ?? "",
                                    fit: BoxFit.cover,
                                    height: 50,
                                    errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/cart.png',
                                    fit: BoxFit.fill,
                                    height: 24,
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                        Text(productlist[index].title ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: colors(context).text,
                              ),
                            )),
                        Text(
                          productlist[index].description ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: colors(context).text,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text("AED ${productlist[index].price}",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colors(context).text),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.favorite_border_rounded,
                        color: Color(0xFF3CA4EB),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
