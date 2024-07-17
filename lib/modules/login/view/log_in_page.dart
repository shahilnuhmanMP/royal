import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royal_class_app/support/app_theme.dart';
import 'package:royal_class_app/support/auth.dart';
import 'package:royal_class_app/support/common_widget/primary_button.dart';
import 'package:royal_class_app/support/common_widget/primary_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errormessage;
  bool isLogin = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signInwithUserEmailAndPassword() async {
    try {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        await Auth().signInWithUserEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        setState(() {
          errormessage = "Please fill all the fields";
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errormessage = e.message;
      });
    }
  }

  createwithUserEmailAndPassword() async {
    try {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        await Auth().createUserEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        setState(() {
          errormessage = "Please fill all the fields";
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errormessage = e.message;
      });
    }
  }

  Widget _errorMessage() {
    return Text(errormessage ?? "");
  }

  @override
  Widget build(BuildContext context) {
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
                          inputTextStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        child: InputText(
                          textEditingController: passwordController,
                          hint: "Password",
                          isObscure: true,
                          inputTextStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: PrimaryButton(
                            color: colors(context).black,
                            text: isLogin == false ? " SignUp" : "  Login",
                            onPressed: () {
                              isLogin == true
                                  ? signInwithUserEmailAndPassword()
                                  : createwithUserEmailAndPassword();
                            }),
                      ),
                      Row(
                        children: [
                          Text(
                            isLogin == true
                                ? "Dont Have an Account?"
                                : "Already have an Account",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isLogin = !isLogin;
                              });
                            },
                            child: Text(
                              isLogin == true ? " SignUp" : "  Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Center(
                          child: Text(
                            errormessage ?? "",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
