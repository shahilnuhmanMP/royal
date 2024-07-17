import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:royal_class_app/support/app_theme.dart';
import 'package:royal_class_app/modules/home/view/homePage.dart';
import 'package:royal_class_app/support/common_widget/bottom_nav_bar_widget.dart';
import 'package:royal_class_app/support/common_widget/primary_button.dart';
import 'package:royal_class_app/support/constants.dart';
import 'package:royal_class_app/support/providers/cart_provider.dart';
import 'package:royal_class_app/support/transition.dart';

// CartPage widget represents the page where the user's cart items are displayed
class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  // Static method to create a route for navigating to this page
  static Route route() {
    return AppFadeTransition(page: const CartPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: colors(context).background,
      appBar: AppBar(
        backgroundColor: colors(context).background,
        title: Text("Your orders",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: colors(context).text)),
      ),
      bottomNavigationBar: BottomNavigation(activeIcon: ""),
      body: ref.watch(cartProvider.notifier).state.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Lottie animation for empty cart
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Lottie.asset(
                    'assets/images/cartLottie.json',
                    height: 300,
                    repeat: true,
                  ),
                ),
                Text("Your Cart is empty",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: colors(context).text)),
                // Button to continue shopping, navigates to the home screen
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                  child: PrimaryButton(
                    text: "Continue Shopping",
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context, HomeScreenPage.route(), (route) => false);
                    },
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(children: [
                    Image.asset(
                      products
                          .firstWhere((element) =>
                              element.id ==
                              ref.watch(cartProvider.notifier).state[i])
                          .image,
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products
                                .firstWhere((element) =>
                                    element.id ==
                                    ref.watch(cartProvider.notifier).state[i])
                                .name,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                              " AED ${products.firstWhere((element) => element.id == ref.watch(cartProvider.notifier).state[i]).price.toString()}")
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          ref.watch(cartProvider.notifier).state.removeWhere(
                              (element) =>
                                  element ==
                                  ref.watch(cartProvider.notifier).state[i]);
                        },
                        child: Icon(Icons.remove_circle))
                  ]),
                  // height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colors(context).white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              itemCount: ref.watch(cartProvider.notifier).state.length,
            ),
    );
  }
}
