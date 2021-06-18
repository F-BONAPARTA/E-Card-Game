import 'package:audioplayers/audioplayers.dart';
import 'package:e_cards/screens/single_mode_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // late AudioPlayer audioPlayer;
  bool isPlaying = false;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/e-card-dca67.appspot.com/o/game_rules.mp4?alt=media&token=f3acdbae-61ca-47df-a0e0-0c0a3ee0ecb2')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    // audioPlayer = AudioPlayer();
    // print(audioPlayer.mode.index);
    //  audioPlayer.play('assets/audio/end.mp3', isLocal: true).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/start.jpg',
            fit: BoxFit.fill,
          ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Container(
          //     width: 200,
          //     height: 200,
          //     color: Colors.black,
          //     child: IconButton(
          //         onPressed: () async {
          //           await audioPlayer.play('assets/audio/end.mp3',
          //               isLocal: true);

          //           isPlaying
          //               ? await audioPlayer.pause()
          //               : await audioPlayer.resume();
          //           setState(() {
          //             isPlaying = !isPlaying;
          //           });
          //         },
          //         icon: Icon(
          //           isPlaying ? Icons.pause : Icons.play_arrow,
          //           color: Colors.white,
          //           size: 100,
          //         )),
          //   ),
          // ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => SingleModeScreen());
                  },
                  style: ButtonStyle(),
                  child: Text('Start New Game'),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    return showDialog<void>(
                      context: context,
                      barrierDismissible: true, // user must tap button!
                      builder: (BuildContext context) {
                        _controller.play();
                        return Center(
                          child: _controller.value.isInitialized
                              ? Container(
                                  child: VideoPlayer(_controller),
                                  width: 600,
                                  height: 700,
                                )
                              : Container(),
                        );
                      },
                    );
                  },
                  style: ButtonStyle(),
                  child: Text('Game Rules'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
