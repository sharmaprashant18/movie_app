import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movieapp/provider/movie_state.dart';

class TabsWidget extends StatelessWidget {
  final ProviderListenable<MovieState>
      provider; //by making this we can call the TabsWIdget in the TabBar and can be excessed the required provider by giving the name itself
  final String pageKey;
  TabsWidget(this.provider, this.pageKey);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final movieS = ref.watch(provider);

        if (movieS.isLoading) {
          return Center(
              child: SpinKitFadingCube(
            color: Colors.red,
            duration: Duration(milliseconds: 6),
          ));
        } else if (movieS.error.isNotEmpty) {
          return Center(child: Text(movieS.error));
        } else {
          return GridView.builder(
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
              return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                      errorWidget: (context, url, error) {
                        return Image.asset('assets/moviesplash.png');
                      },
                      placeholder: (context, url) {
                        return Center(
                            child: SpinKitDualRing(
                          color: Colors.redAccent,
                          duration: Duration(milliseconds: 1),
                        ));
                      },
                      imageUrl: movie.poster_path));
            },
          );
        }
      },
    );
  }
}
