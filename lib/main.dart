import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:royal_class_app/firebase_options.dart';
import 'package:royal_class_app/support/app_theme.dart';
import 'package:royal_class_app/support/app_theme_provider.dart';
import 'package:royal_class_app/support/widget_tree.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner
      theme: getAppTheme(
          context,
          ref.watch(
              appThemeProvider)), // Get app theme based on current context and theme provider state
      home: const WidgetTree(), // Set LoginPage as the home screen
    );
  }
}
