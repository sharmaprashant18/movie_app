import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/provider/movie_state.dart';

class TabsWidget extends StatelessWidget {
  final ProviderListenable<MovieState>
      provider; //by making this we can call the TabsWIdget in the TabBar and can be excessed the required provider by giving the name itself
  TabsWidget({required this.provider});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final movieS = ref.watch(provider);

        if (movieS.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (movieS.error.isNotEmpty) {
          return Center(child: Text(movieS.error));
        } else {
          return GridView.builder(
            itemCount: movieS.movies.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 7,
                crossAxisSpacing: 5),
            itemBuilder: (context, index) {
              final movie = movieS.movies[index];
              return ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.network(movie.backdrop_path));
            },
          );
        }
      },
    );
  }
}
