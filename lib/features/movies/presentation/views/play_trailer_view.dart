import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerPage extends StatefulWidget {
  final String videoId;

  const YoutubePlayerPage({super.key, required this.videoId});

  @override
  State<YoutubePlayerPage> createState() => _YoutubePlayerPageState();
}

class _YoutubePlayerPageState extends State<YoutubePlayerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,

      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),

    );
    _controller.toggleFullScreenMode();
    /// on completion of video
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: YoutubePlayerBuilder(

          player: YoutubePlayer(controller: _controller, onEnded: (_) {
            _controller.toggleFullScreenMode();
            Navigator.of(context).pop();
          },),
          builder: (context, player) {
            return player;
          },
        ),
      ),
    );
  }
}
