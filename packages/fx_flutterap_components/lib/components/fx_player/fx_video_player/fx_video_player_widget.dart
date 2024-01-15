import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:video_player/video_player.dart';
import 'fx_overlay_widget.dart';

class FxVideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController controller;
  final Widget playIcon;
  final Widget? forwardIcon;
  final Widget? backwardIcon;
  final Widget videoCover;
  final VoidCallback onClickedFullScreen;
  final Duration? fastForwardDuration;
  final Duration? fastBackwardDuration;

  const FxVideoPlayerWidget({
    Key? key,
    required this.controller,
    required this.playIcon,
    this.forwardIcon,
    this.backwardIcon,
    required this.videoCover,
    required this.onClickedFullScreen,
    this.fastForwardDuration,
    this.fastBackwardDuration,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxVideoPlayerWidgetState();
  }
}

class _FxVideoPlayerWidgetState extends State<FxVideoPlayerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: widget.controller.value.aspectRatio,
            child:
                Container(alignment: Alignment.topCenter, child: _buildVideo()))
        : Container(
            color: InitialStyle.secondaryDarkColor,
            child: const Center(child: CircularProgressIndicator()));
  }

  Widget _buildVideo() => Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _buildVideoPlayer(),
          Positioned(
            child: FxOverlayWidget(
                playIcon: widget.playIcon,
                forwardIcon: widget.forwardIcon,
                backwardIcon: widget.backwardIcon,
                videoCover: widget.videoCover,
                controller: widget.controller,
                fastBackwardDuration: widget.fastBackwardDuration,
                fastForwardDuration: widget.fastForwardDuration,
                onClickedFullScreen: widget.onClickedFullScreen),
          ),
        ],
      );

  Widget _buildVideoPlayer() {
    final video = AspectRatio(
        aspectRatio: widget.controller.value.aspectRatio,
        child: VideoPlayer(widget.controller));

    return video;
  }
}
