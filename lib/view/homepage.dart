import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/provider/popular_provider.dart';
import 'package:movieapp/provider/toprated_provider.dart';
import 'package:movieapp/provider/upcoming_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 75,
              title: Text(
                'Movie Time',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
              bottom: TabBar(
                labelStyle: TextStyle(
                    color: Colors
                        .white), //labelstyle changes the color of the text if the indicator  goes there
                unselectedLabelColor: Colors.cyan,
                dividerHeight: 5,
                dividerColor: Colors.blue,
                indicator: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(40),
                ),
                tabs: [
                  Tab(
                    text: 'Popular',
                  ),
                  Tab(
                    text: 'Top Rated',
                  ),
                  Tab(
                    text: 'Up Coming',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Center(
                  child: Consumer(
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
                            Image.network(movieS.movies[9].poster_path),
                            Text(movieS.movies[2].title)
                          ],
                        ));
                      }
                    },
                  ),
                ),
                Center(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final movieS = ref.watch(upComingProvider);

                      if (movieS.isLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (movieS.error.isNotEmpty) {
                        return Center(child: Text(movieS.error));
                      } else {
                        return Center(
                            child: Column(
                          children: [
                            Image.network(movieS.movies[9].poster_path),
                            Text(movieS.movies[2].title)
                          ],
                        ));
                      }
                    },
                  ),
                ),
                Center(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final movieS = ref.watch(topRatedProvider);

                      if (movieS.isLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (movieS.error.isNotEmpty) {
                        return Center(child: Text(movieS.error));
                      } else {
                        return Center(
                            child: Column(
                          children: [
                            Image.network(movieS.movies[9].poster_path),
                            Text(movieS.movies[2].title)
                          ],
                        ));
                      }
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

// Consumer(
//             builder: (context, ref, child) {
//               final movieS = ref.watch(popularProvider);

//               if (movieS.isLoading) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (movieS.error.isNotEmpty) {
//                 return Center(child: Text(movieS.error));
//               } else {
//                 return Center(
//                     child: Column(
//                   children: [
//                     Image.network(movieS.movies[9].poster_path),
//                     Text(movieS.movies[2].title)
//                   ],
//                 ));
//               }
//             },
//           ),
