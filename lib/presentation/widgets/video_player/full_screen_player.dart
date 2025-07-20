import 'package:flutter/material.dart';
import 'package:tok_tik/presentation/widgets/video_player/player_bg_gradient.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController _controller;

  // Stateful widgets are widgets that have their own internal state.
  // initState is like the Angular's onInit() or Vue's onMounted()
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  // dispose is like the Angular's onDestroy() or Vue's onUnmount()
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use a FutureBuilder to display a loading spinner while waiting for the
    // VideoPlayerController to finish initializing.
    return FutureBuilder(
        future: _controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // ? GestureDetector is a special widget to detect touch gestures
          return GestureDetector(
            onTap: () {
              if (_controller.value.isPlaying) {
                _controller.pause();
                return;
              }
              _controller.play();
            },
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(_controller),
                  PlayerBgGradient(
                    stops: const [0.8, 1.0],
                  ),
                  Positioned(
                    bottom: 50,
                    left: 20,
                    child: _VideoCaption(caption: widget.caption),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
        width: size.width * 0.6,
        child: Text(
          caption,
          maxLines: 2,
          style: titleStyle,
        ));
  }
}
