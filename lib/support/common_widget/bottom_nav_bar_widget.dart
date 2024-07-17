import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:royal_class_app/support/app_theme.dart';

class BottomNavigation extends StatelessWidget {
  final String activeIcon;
  BottomNavigation({Key? key, this.activeIcon = ''}) : super(key: key);

  ValueNotifier<String> activeIcone = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    activeIcone.value = activeIcon;
    return Stack(
      children: [
        Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.transparent,
                  colors(context).shadowColor!,
                ],
                stops: [0.0, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: colors(context).shadowColor!,
                  spreadRadius: 15,
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Image.asset(
              "assets/images/bottom.png",
              fit: BoxFit.fitWidth,
            )),
        Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavigationIcon(
                iconLabel: "cycle",
                iconData: "assets/images/cycle.png",
                isActive: activeIcon == "cycle",
                onTap: () {
                  HapticFeedback.lightImpact();
                  activeIcone.value = "cycle";
                },
              ),
              BottomNavigationIcon(
                iconLabel: "map",
                iconData: "assets/images/map.png",
                isActive: activeIcon == "map",
                onTap: () {
                  HapticFeedback.lightImpact();
                  activeIcone.value = "map";
                },
              ),
              BottomNavigationIcon(
                iconLabel: "cart",
                iconData: "assets/images/cart.png",
                isActive: activeIcon == "map",
                onTap: () {
                  HapticFeedback.lightImpact();
                  activeIcone.value = "cart";
                },
              ),
              BottomNavigationIcon(
                iconLabel: "person",
                iconData: "assets/images/person.png",
                isActive: activeIcon == "person",
                onTap: () {
                  HapticFeedback.lightImpact();
                  activeIcone.value = "person";
                },
              ),
              BottomNavigationIcon(
                iconLabel: "doc",
                iconData: "assets/images/doc.png",
                isActive: activeIcon == "doc",
                onTap: () {
                  HapticFeedback.lightImpact();
                  activeIcone.value = "doc";
                },
              ),
            ],
          ),
        ),
        _activeNavBar(activeIcone: activeIcone)
      ],
    );
  }
}

class _activeNavBar extends StatelessWidget {
  const _activeNavBar({
    super.key,
    required this.activeIcone,
  });

  final ValueNotifier<String> activeIcone;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: activeIcone,
        builder: (context, val, child) {
          return Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 70,
                    height: 60,
                    child: activeIcone.value == "cycle"
                        ? Stack(
                            children: [
                              Image.asset("assets/images/active.png"),
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/cycle.png",
                                  height: 20,
                                ),
                              )
                            ],
                          )
                        : Container()),
                Container(
                    width: 70,
                    height: 60,
                    child: activeIcone.value == "map"
                        ? Stack(
                            children: [
                              Image.asset("assets/images/active.png"),
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/map.png",
                                  height: 20,
                                ),
                              )
                            ],
                          )
                        : Container()),
                Container(
                    width: 70,
                    height: 60,
                    child: activeIcone.value == "cart"
                        ? Stack(
                            children: [
                              Image.asset("assets/images/active.png"),
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/cart.png",
                                  height: 20,
                                ),
                              )
                            ],
                          )
                        : Container()),
                Container(
                    width: 70,
                    height: 60,
                    child: activeIcone.value == "person"
                        ? Stack(
                            children: [
                              Image.asset("assets/images/active.png"),
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/person.png",
                                  height: 20,
                                ),
                              )
                            ],
                          )
                        : Container()),
                Container(
                    width: 70,
                    height: 60,
                    child: activeIcone.value == "doc"
                        ? Stack(
                            children: [
                              Image.asset("assets/images/active.png"),
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/doc.png",
                                  height: 20,
                                ),
                              )
                            ],
                          )
                        : Container()),
              ],
            ),
          );
        });
  }
}

class BottomNavigationIcon extends StatelessWidget {
  final String iconLabel;
  final String iconData;
  final bool isActive;
  final Function() onTap;

  const BottomNavigationIcon(
      {Key? key,
      required this.iconData,
      required this.iconLabel,
      required this.isActive,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: 68,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconData,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
