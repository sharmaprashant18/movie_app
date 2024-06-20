// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           appBar: AppBar(
//             actions: [
//               AnimatedContainer(
//                 duration: const Duration(milliseconds: 5),
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.horizontal(
//                         left: Radius.elliptical(10, 20))),
//                 child: IconButton(
//                   icon: const Icon(Icons.search),
//                   color: Colors.white,
//                   onPressed: () {},
//                 ),
//               ),
//             ],
//           ),
//           body: Container()),
//     );
//   }
// }

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
