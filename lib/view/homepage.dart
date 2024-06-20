import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/provider/movie_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer(
          builder: (context, ref, child) {
            final movieS = ref.watch(popularProvider);

            if (movieS.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (movieS.error.isNotEmpty) {
              return Center(child: Text(movieS.error));
            } else {
              return Center(
                  child: Column(
                children: [
                  Image.network(
                      'https://image.tmdb.org/t/p/w600_and_h900_bestv2' +
                          movieS.movies[9].poster_path),
                  Text(movieS.movies[2].title)
                ],
              ));
            }
          },
        ),
      ),
    );
  }
}
