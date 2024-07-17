import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royal_class_app/modules/home/model/product.dart';
import 'package:royal_class_app/modules/home/widget/carausal_widget.dart';
import 'package:royal_class_app/support/app_theme.dart';
import 'package:royal_class_app/support/common_widget/dot_indicator.dart';
import 'package:royal_class_app/support/transition.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  static Route route({required Product product}) {
    return AppFadeTransition(
        page: ProductDetailsPage(
      product: product,
    ));
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> carausalIndex = ValueNotifier(0);

    return Scaffold(
      backgroundColor: colors(context).background,
      body: Stack(
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Row(
                      children: [
                        CustomBackbutton(),
                        Expanded(
                          child: Text(
                            product.title ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    color: colors(context).text,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CarouselWidget(
                    images: product.images ?? [],
                    pageIndex: carausalIndex,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ValueListenableBuilder(
                        valueListenable: carausalIndex,
                        builder: (context, val, child) {
                          return DotIndicator(
                            length: product.images?.length ?? 1,
                            pageIndex: carausalIndex.value,
                            height: 10,
                            width: 10,
                            activeWidth: 10,
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: colors(context).background,
                  boxShadow: [
                    BoxShadow(
                      color: colors(context).shadowColor!.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(10, 0), // Shadow position, bottom
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              height: MediaQuery.of(context).size.height * 0.5,
              child: Consumer(builder: (context, ref, child) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 32),
                      child: CustomDescriptionSwitch(),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        product.description ?? "",
                        style: TextStyle(color: colors(context).text),
                      ),
                    )),
                    Container(
                      height: 104,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                colors(context).shadowColor!.withOpacity(0.3),
                            spreadRadius: 10,
                            blurRadius: 10,
                            offset: Offset(-5, -10), // Shadow position, bottom
                          ),
                        ],
                        color: colors(context).background,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Center(
                                      child: Text('\$ 1,999.99',
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: colors(context).primary,
                                              fontWeight: FontWeight.w500)))),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      height: 44,
                                      width: 100,
                                      child: Center(
                                        child: Text("Add to cart",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: colors(context).text,
                                                    fontWeight:
                                                        FontWeight.w500))),
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
                                      )),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

class CustomDescriptionSwitch extends StatelessWidget {
  const CustomDescriptionSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 43,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colors(context).background,
              boxShadow: [
                BoxShadow(
                  color: colors(context).text!.withOpacity(0.02),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(-5, -10), // Shadow position, bottom
                ),
                BoxShadow(
                  color: colors(context).shadowColor!.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(5, 10), // Shadow position, bottom
                ),
              ]),
          child: Center(
              child: Text('Description',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF3CA4EB),
                          fontWeight: FontWeight.w700)))),
        )),
        SizedBox(
          width: 30,
        ),
        Expanded(
            child: Container(
          height: 43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colors(context).background,
          ),
          child: Container(
            decoration: BoxDecoration(
                color: colors(context).background,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: colors(context).shadowColor!.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(-3, -5), // Shadow position, bottom
                  ),
                  BoxShadow(
                    color: colors(context).text!.withOpacity(0.025),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(3, 5), // Shadow position, bottom
                  ),
                ]),
            margin: EdgeInsets.all(5),
            child: Center(
                child: Text('Specification',
                    style: TextStyle(
                        fontSize: 15,
                        color: colors(context).text,
                        fontWeight: FontWeight.w500))),
          ),
        )),
      ],
    );
  }
}

class CustomBackbutton extends StatelessWidget {
  const CustomBackbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 50,
        width: 50,
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: colors(context).shadowColor!,
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 10), // Shadow position, bottom
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF34C8E8),
              Color(0xFF4E4AF2),
            ],
            stops: [0.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
            child: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: colors(context).text,
        )),
      ),
    );
  }
}
