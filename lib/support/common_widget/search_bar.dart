import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal_class_app/support/app_theme.dart';

class SearchBarWidget extends StatelessWidget {
  final Function onTap;
  const SearchBarWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
      child: SizedBox(
          height: 50,
          width: double.infinity,
          child: CupertinoSearchTextField(
            onTap: () {
              onTap();
            },
            onChanged: (s) {},
            placeholder: ' Search products...',
            prefixIcon: ImageIcon(
              const AssetImage('assets/images/search.png'),
              size: 15,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: colors(context).disable!.withOpacity(0.3),
              ),
            ),
            style: TextStyle(fontSize: 13, color: colors(context).white),
          )),
    );
  }
}
