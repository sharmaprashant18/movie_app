import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:movieapp/api.dart';
import 'package:movieapp/view/homepage.dart';

void main() {
  runApp(ProviderScope(child: Home()));
  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
