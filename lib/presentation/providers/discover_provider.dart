import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entitites/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  List<VideoPost> videos = [];
  bool initialLoading = true;

  Future<void> loadNextVideo() async {
    // ? Load Video

    notifyListeners();
  }
}
