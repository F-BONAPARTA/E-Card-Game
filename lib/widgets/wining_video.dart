import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class WiningVideoWidget extends StatefulWidget {
  final String videoUrl;
  const WiningVideoWidget({
    required this.videoUrl,
  });

  @override
  _WiningVideoWidgetState createState() => _WiningVideoWidgetState();
}

class _WiningVideoWidgetState extends State<WiningVideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  void _addListtenerToTheVideo() {
    _controller.addListener(() {
      if (_controller.value.isPlaying == false) {
        // Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.play();
    _addListtenerToTheVideo();
    return Center(
      child: _controller.value.isInitialized
          ? Container(
              child: VideoPlayer(_controller),
              width: 600,
              height: 700,
            )
          : Container(),
    );
  }
}
