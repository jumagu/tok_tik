import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik/presentation/providers/discover_provider.dart';
import 'package:tok_tik/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();
    // final discoverProvider = Provider.of<DiscoverProvider>(context,  listen: false); // Another to use the provider

    return Scaffold(
        body: discoverProvider.initialLoading
            ? const Center(child: CircularProgressIndicator())
            : VideoScrollableView(videos: discoverProvider.videos));
  }
}
