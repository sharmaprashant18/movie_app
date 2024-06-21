import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:movieapp/provider/movie_provider.dart';

import 'package:movieapp/view/widgets/tabs.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return DefaultTabController(
      length: 5,
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
                isScrollable: T,
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
                  Tab(
                    text: 'Now Playing',
                  ),
                  Tab(
                    text: 'Latest',
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: [
                TabsWidget(popularProvider,
                    'popular'), //'popular' is the pageKey which is in string soo something must be given same as in the other provider also

                TabsWidget(topRatedProvider, 'top'),
                TabsWidget(upComingProvider, 'upcoming'),
                TabsWidget(nowPlaying, 'nowplaying'),
                TabsWidget(latest, 'latest')
              ],
            )),
      ),
    );
  }
}
