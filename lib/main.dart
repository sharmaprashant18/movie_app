import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'package:movieapp/view/homepage.dart';

void main() async {
  // final response =
  //     await MovieService.getMovieByCategory(apiPath: Api.popularMovie, page: 1);
  // response.fold((l) => print(l), (r) => print(r));
  runApp(ProviderScope(child: Home()));
  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle());
  await Future.delayed(Duration(milliseconds: 10));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
