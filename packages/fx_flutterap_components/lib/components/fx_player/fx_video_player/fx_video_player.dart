
import 'package:fx_flutterap_components/components/fx_player/fx_video_player/fx_video_player_widget.dart';
import 'package:fx_flutterap_components/components/fx_player/fx_video_player/fx_full_screen_video_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';


class FxVideoPlayer extends StatefulWidget {
  final String videoUrl;

  final Widget playIcon;
  final Widget videoCover;
  final Widget? forwardIcon;
  final Widget? backwardIcon;
  final Duration? fastForwardDuration;
  final Duration? fastBackwardDuration;


  const FxVideoPlayer({
    Key? key,
    required this.playIcon,
    required this.videoCover,
    required this.videoUrl,
    this.forwardIcon,
    this.backwardIcon,
     this.fastForwardDuration,
     this.fastBackwardDuration,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _FxVideoPlayerState();
  }
}

class _FxVideoPlayerState extends State<FxVideoPlayer> {
  late VideoPlayerController controller;

  // ignore: unused_field
  late Future<bool> _data;
  @override
  void initState() {
    super.initState();
    _data = _getData();
    // ignore: deprecated_member_use
    controller = VideoPlayerController.network(widget.videoUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => () {

      });

    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    // AutoOrientation.portraitUpMode();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child:_buildPlayer()
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Widget _buildPlayer(){
    return FxVideoPlayerWidget(
      onClickedFullScreen: () async {
        controller.pause();

        VideoPlayerController fullScreenController = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  FxFullScreenVideoPage(
                  playIcon: widget.playIcon,
                  forwardIcon: widget.forwardIcon,
                  backwardIcon: widget.backwardIcon,
                  fastForwardDuration: widget.fastForwardDuration,
                  fastBackwardDuration: widget.fastBackwardDuration,

                  controller: controller,
                  videoUrl: widget.videoUrl,
                ),

            )
        );
        setState(() {
          controller=fullScreenController;

        });
        controller = fullScreenController
          ..addListener(() => setState(() {}))
          ..setLooping(false)
          ..initialize().then((_) => () {});
        await Future.delayed(const Duration(milliseconds: 100), () {_data = _getData();});



      },
      controller: controller,
      videoCover: widget.videoCover,
      playIcon: widget.playIcon,
      forwardIcon: widget.forwardIcon,
      backwardIcon: widget.backwardIcon,
      fastForwardDuration: widget.fastForwardDuration,
      fastBackwardDuration: widget.fastBackwardDuration,
    );
  }

  Future<bool> _getData() async {
    await Future.delayed(const Duration(milliseconds: 200), () {});

    controller.seekTo(controller.value.position);

    return true;
  }

}

