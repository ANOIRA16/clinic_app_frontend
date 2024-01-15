
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:video_player/video_player.dart';

class FxOverlayWidget extends StatefulWidget {
  final VideoPlayerController controller;
  final VoidCallback onClickedFullScreen;
  final Widget playIcon;
  final Widget? forwardIcon;
  final Widget? backwardIcon;
  final Duration? fastForwardDuration;
  final Duration? fastBackwardDuration;
  final Widget videoCover;

  const FxOverlayWidget({
    Key? key,
    required this.controller,
    required this.onClickedFullScreen,
    required this.playIcon,
    this.forwardIcon,
    this.backwardIcon,
    this.fastForwardDuration,
    this.fastBackwardDuration,
    required this.videoCover,
  }) : super(key: key);

  @override
  State<FxOverlayWidget> createState() => _FxOverlayWidgetState();
}
bool _fullScreenStatus=false;
class _FxOverlayWidgetState extends State<FxOverlayWidget> {
  Duration _fastForwardDuration = const Duration(seconds: 10);
  Duration _fastBackwardDuration = const Duration(seconds: 5);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fastForwardDuration =
        widget.fastForwardDuration ?? const Duration(seconds: 5);
    _fastBackwardDuration =
        widget.fastBackwardDuration ?? const Duration(seconds: 5);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => widget.controller.value.isPlaying
          ? widget.controller.pause()
          : widget.controller.play(),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 0,
              left: 0,
              right: InitialDims.space5,
              child: Row(
                children: [
                  Expanded(child: _buildIndicator(context)),
                  SizedBox(
                    width: InitialDims.space1,
                  ),
                  GestureDetector(
                    onTap:() {
                       widget.onClickedFullScreen();
                       setState(() {
                         _fullScreenStatus=!_fullScreenStatus;
                       });},
                    child: Icon(
                      _fullScreenStatus?Icons.fullscreen_exit: Icons.fullscreen,
                      color: InitialStyle.icon,
                      size: InitialDims.icon5,
                    ),
                  ),
                  SizedBox(width: InitialDims.space2),
                ],
              )),
          widget.controller.value.isPlaying ? Container() : widget.videoCover,
          _buildPlay(widget.playIcon),
          widget.forwardIcon == null
              ? Container()
              : Positioned(
                  right: InitialDims.space5,
                  bottom: (InitialDims.space20) * 2,
                  child: _buildForward(widget.forwardIcon ?? Container()),
                ),
          widget.forwardIcon == null
              ? Container()
              : Positioned(
                  left: InitialDims.space5,
                  bottom: (InitialDims.space20) *2,
                  child: _buildBackward(widget.backwardIcon ?? Container()),
                )
        ],
      ),
    );
  }

  Widget _buildIndicator(BuildContext context) => Container(
        margin: EdgeInsets.all(
          InitialDims.space2,
        ).copyWith(
          right: InitialDims.space2,
        ),
        height: InitialDims.space2,
        child: VideoProgressIndicator(
          widget.controller,
          colors:  VideoProgressColors(
              playedColor: InitialStyle.primaryColor),
          allowScrubbing: true,
        ),
      );

  Widget _buildPlay(Widget playIcon) => widget.controller.value.isPlaying
      ? Container()
      : Container(
          color: Colors.black26,
          child: Center(
            child: playIcon,
          ),
        );

  Widget _buildForward(Widget forwardIcon) => InkWell(
        onTap: () {
          Duration currentPosition = widget.controller.value.position;
          Duration targetPosition = currentPosition + _fastForwardDuration;
          widget.controller.seekTo(targetPosition);
        },
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: forwardIcon,
          ),
        ),
      );

  Widget _buildBackward(Widget backwardIcon) => InkWell(
        onTap: () {
          Duration currentPosition = widget.controller.value.position;
          Duration targetPosition = currentPosition - _fastBackwardDuration;
          widget.controller.seekTo(targetPosition);
        },
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: backwardIcon,
          ),
        ),
      );
}
