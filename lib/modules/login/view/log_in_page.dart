import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royal_class_app/support/app_theme.dart';
import 'package:royal_class_app/modules/home/view/homePage.dart';
import 'package:royal_class_app/support/common_widget/primary_button.dart';
import 'package:royal_class_app/support/common_widget/primary_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(48),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 120),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 50),
                          child: Image.asset(
                            "assets/images/logo.png",
                            width: 170,
                            color: colors(context).text,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Text(
                              "Welcome back",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: colors(context).text)),
                            ),
                          ),
                          Text(
                            "Pleas Enter your email and password to login",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: colors(context).description)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: InputText(
                          textEditingController: emailController,
                          hint: "Email address",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        child: InputText(
                          textEditingController: passwordController,
                          hint: "Password",
                          isObscure: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: PrimaryButton(
                            color: colors(context).black,
                            text: "Login",
                            onPressed: () {
                              Navigator.push(context, HomeScreenPage.route());
                            }),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
