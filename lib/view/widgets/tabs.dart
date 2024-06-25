import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:movieapp/view/detail_page.dart';

import 'package:shimmer/shimmer.dart';

class TabsWidget extends StatelessWidget {
  final provider; //by making this we can call the TabsWIdget in the TabBar and can be excessed the required provider by giving the name itself
  final String pageKey;
  TabsWidget(this.provider, this.pageKey);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OfflineBuilder(
        child: Column(
          children: [Text('No Internet Connection')],
        ),
        connectivityBuilder: (context, value, child) {
          return Consumer(
            builder: (context, ref, child) {
              final movieS = ref.watch(provider);

              if (movieS.isLoading) {
                return Center(
                    child: Shimmer.fromColors(
                        child: Text(''),
                        baseColor: Colors.red,
                        highlightColor: Colors.red));
              } else if (movieS.error.isNotEmpty) {
                return Center(child: Text(movieS.error));
              } else {
                return NotificationListener(
                    onNotification: (ScrollEndNotification onNotification) {
                      final before = onNotification.metrics.extentBefore;
                      final max = onNotification.metrics.maxScrollExtent;
                      if (before == max) {
                        ref.read(provider.notifier).loadMore();
                      }
                      return true;
                    },
                    child: GridView.builder(
                      key: PageStorageKey(
                          pageKey), //this lets the same value where we left after scrolling going to another and coming to previous one
                      itemCount: movieS.movies.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                  errorWidget: (context, url, error) {
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
                    ));
              }
            },
          );
        },
      ),
    );
  }
}
