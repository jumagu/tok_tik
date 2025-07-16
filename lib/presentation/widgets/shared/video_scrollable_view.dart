import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entitites/video_post.dart';
import 'package:tok_tik/presentation/widgets/shared/video_buttons.dart';
import 'package:tok_tik/presentation/widgets/video_player/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    // Widget that shows in fullscreen an behaves like a slider
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(children: [
          // Video player + gradient
          SizedBox.expand(
              child: FullScreenPlayer(
            videoUrl: videoPost.videoUrl,
            caption: videoPost.caption,
          )),

          // Buttons
          // Positioned works as a position: fixed; in CSS
          Positioned(
              bottom: 40, right: 20, child: VideoButtons(video: videoPost))
        ]);
      },
    );
  }
}
