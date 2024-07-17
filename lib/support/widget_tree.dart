import 'package:flutter/material.dart';
import 'package:royal_class_app/modules/home/view/homePage.dart';
import 'package:royal_class_app/modules/login/view/log_in_page.dart';
import 'package:royal_class_app/support/auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreenPage();
          } else {
            return LoginPage();
          }
        });
  }
}
