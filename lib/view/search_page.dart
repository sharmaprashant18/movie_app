import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:movieapp/provider/search_provider.dart';
import 'package:movieapp/view/detail_page.dart';
import 'package:shimmer/shimmer.dart';

class SearchPage extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final movieS = ref.watch(search);
        return SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: Container(
                child: Column(
                  children: [
                    TextFormField(
                      controller: textController,
                      onFieldSubmitted: (value) {
                        if (value.isEmpty) {
                          Get.defaultDialog(
                              title: 'Required',
                              middleText: 'Please enter a search query');
                        } else {
                          ref.read(search.notifier).getData(searchText: value);
                          textController.clear();
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Search Movie',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.only(left: 2)),
                    ),
                    Expanded(
                        child: movieS.isLoading
                            ? SpinKitChasingDots(color: Colors.red)
                            : movieS.error.isEmpty
                                ? GridView.builder(
                                    itemCount: movieS.movies.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 2 / 3,
                                            mainAxisSpacing: 7,
                                            crossAxisSpacing: 5),
                                    itemBuilder: (context, index) {
                                      final movie = movieS.movies[index];
                                      return InkWell(
                                        splashColor: Colors.green,
                                        onTap: () {
                                          Get.to(() => DetailPage(movie));
                                        },
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                                errorWidget:
                                                    (context, url, error) {
                                                  return Image.asset(
                                                      'assets/moviesplash.png');
                                                },
                                                placeholder: (context, url) {
                                                  return Center(
                                                      child: Shimmer.fromColors(
                                                          child: Text(''),
                                                          baseColor: Colors.red,
                                                          highlightColor: Colors
                                                              .red)); //Shimmer is used for the loading like the youtube
                                                },
                                                imageUrl: movie.poster_path)),
                                      );
                                    },
                                  )
                                : Text(
                                    movieS.error,
                                    style: TextStyle(color: Colors.red),
                                  ))
                  ],
                ),
              )),
        );
      },
    );
  }
}
