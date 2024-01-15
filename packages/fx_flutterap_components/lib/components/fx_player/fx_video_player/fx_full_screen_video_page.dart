import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:video_player/video_player.dart';
import 'fx_video_player_widget.dart';

class FxFullScreenVideoPage extends StatefulWidget {
  final String videoUrl;
  final Widget playIcon;
  final VideoPlayerController controller;
  final Widget? forwardIcon;
  final Widget? backwardIcon;
  final Duration? fastForwardDuration;
  final Duration? fastBackwardDuration;

  const FxFullScreenVideoPage({
    Key? key,
    this.videoUrl = "",
    required this.playIcon,
    required this.controller,
    this.forwardIcon,
    this.backwardIcon,
    this.fastForwardDuration,
    this.fastBackwardDuration,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxFullScreenVideoPageState();
  }
}

class _FxFullScreenVideoPageState extends State<FxFullScreenVideoPage> {
  late VideoPlayerController _controller;

  late Future<bool> _data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _data = _getData();
    _controller = widget.controller
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize().then((_) => () {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool vertical = (height / width) >= 1;

    return RotatedBox(
      quarterTurns: vertical ? 1 : 0,
      child: _playerContent(),
    );
  }

  Widget _playerContent() {
    return Material(
      color: InitialStyle.black,
      child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          alignment: Alignment.center,
          child: FutureBuilder(
              future: _data,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return FxVideoPlayerWidget(
                    videoCover: Container(),
                    playIcon: widget.playIcon,
                    forwardIcon: widget.forwardIcon,
                    backwardIcon: widget.backwardIcon,
                    fastForwardDuration: widget.fastForwardDuration,
                    fastBackwardDuration: widget.fastBackwardDuration,
                    onClickedFullScreen: () {
                      _controller.pause();

                      Navigator.pop(context, _controller);
                    },
                    controller: _controller,
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }

  Future<bool> _getData() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});

    _controller.seekTo(widget.controller.value.position);

    return true;
  }
}
