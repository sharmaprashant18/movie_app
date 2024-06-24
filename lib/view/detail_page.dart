import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/services/movie_service.dart';
import 'package:pod_player/pod_player.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;
  DetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final videoData = ref.watch(videoProvider(movie.id));
          return ListView(
            children: [
              videoData.when(
                  data: (data) {
                    return VideoWidget(data[0].key);
                  },
                  error: (err, stack) => Center(child: Text('$err')),
                  loading: () => Container())
            ],
          );
        },
      ),
    );
  }
}

class VideoWidget extends StatefulWidget {
  final String videoKey;
  VideoWidget(this.videoKey);
  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom:
          PlayVideoFrom.youtube('https://youtu.be/${widget.videoKey}'),
      podPlayerConfig: const PodPlayerConfig(
          autoPlay: true, videoQualityPriority: [1080, 144]),
    )..initialise();
    super.initState();
  }

  // PodPlayer is used to play the video and above is the syntax for the  podPlayer which can be seen in the library
  @override
  void dispose() {
    controller.dispose();
    super
        .dispose(); //dispose should be done if not done then the video will be played in the background after being closed
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(
      controller: controller,
      // PodVideoPlayer is used to display the video
    );
  }
}
