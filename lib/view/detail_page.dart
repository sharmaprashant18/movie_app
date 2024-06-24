import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final PodPlayerController controller;
  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(
        'https://api.themoviedb.org/3/movie/1022789/videos?api_key=f370a118f8c9551e6f47b9193d032054',
      ),
      podPlayerConfig:
          PodPlayerConfig(autoPlay: true, videoQualityPriority: [1080, 144]),
    )..initialise();
    super.initState();
  }
  // PodPlayer is used to play the video and above is the syntax for the  podPlayer which can be seen in the library

  void dispose() {
    controller.dispose();
    super
        .dispose(); //dispose should be done if not done then the video will be played in the background after being closed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: PodVideoPlayer(
        controller: controller,
        // PodVideoPlayer is used to display the video

        videoThumbnail: DecorationImage(
            image: AssetImage('assests/movieicon.png'), fit: BoxFit.cover),
      )),
    );
  }
}
