import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royal_class_app/support/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  late final String text;
  late final double width;
  late final double height;
  late final Function onPressed;
  late final bool loading;
  final TextStyle? textStyle;
  final Color? color;
  final bool isDisabled;
  final Widget? child;
  final bool? flexibleWidth;
  PrimaryButton(
      {required this.text,
      this.width = double.infinity,
      this.height = 42.0,
      required this.onPressed,
      this.loading = false,
      this.color,
      this.textStyle,
      this.isDisabled = false,
      this.child,
      this.flexibleWidth});
  PrimaryButton.text(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color,
      this.textStyle,
      required this.width,
      required this.height,
      required this.loading,
      this.isDisabled = false,
      this.child,
      this.flexibleWidth})
      : super(key: key) {
    this.loading = false;
    this.width = double.infinity;
    this.height = 42.0;
  }
  PrimaryButton.loading(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.loading = false,
      this.color,
      this.textStyle,
      required this.width,
      required this.height,
      this.isDisabled = false,
      this.child,
      this.flexibleWidth})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: flexibleWidth == true ? null : width,
        height: height,
        child: ElevatedButton(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(const Size(200, 58)),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            elevation: WidgetStateProperty.all(0),
            shadowColor: WidgetStateProperty.all(color ?? Colors.transparent),
          ),
          onPressed: () {
            if (!loading && !isDisabled) {
              HapticFeedback.lightImpact();
              onPressed();
            }
          },
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colors(context).shadowColor!,
                  colors(context).background!
                ], // Your gradient colors here
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              constraints: BoxConstraints(minWidth: 200, minHeight: 58),
              alignment: Alignment.center,
              child: loading
                  ? const CircularProgressIndicator()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text,
                          style: textStyle ??
                              GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color: colors(context).text,
                                      fontWeight: FontWeight.w500)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: child,
                        )
                      ],
                    ),
            ),
          ),
        ));
  }
}
