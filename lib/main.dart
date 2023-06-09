import 'package:flutter/material.dart';
import 'package:trendy_fashion/main_wrapper.dart';
import 'package:trendy_fashion/screen/cart.dart';
import 'package:trendy_fashion/screen/home.dart';
import 'package:trendy_fashion/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Fashing',
      theme:AppTheme.appTheme,
      home: const MainWrapper()
    );
  }
}

