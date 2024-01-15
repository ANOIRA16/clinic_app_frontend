import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class FxPlayButtons extends StatefulWidget {
  final AudioPlayer player;
  final Duration? fastForwardDuration;
  final Duration? fastBackwardDuration;
  final ValueChanged<double> onChanged;

  const FxPlayButtons({
    Key? key,
    required this.player,
    this.fastForwardDuration,
    this.fastBackwardDuration,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<FxPlayButtons> createState() => _FxPlayButtonsState();
}

class _FxPlayButtonsState extends State<FxPlayButtons> {
  
  Duration _fastForwardDuration = const Duration(seconds: 10);
  Duration _fastBackwardDuration = const Duration(seconds: 5);

  late Stream<PlayerState> _player;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = widget.player.playerStateStream;
    _fastForwardDuration =
        widget.fastForwardDuration ?? const Duration(seconds: 10);
    _fastBackwardDuration =
        widget.fastBackwardDuration ?? const Duration(seconds: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: StreamBuilder<PlayerState>(
        stream: _player,
        builder: (BuildContext context, AsyncSnapshot<PlayerState> snapshot) {
          _debugStatusPrinter(snapshot);
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _audioForwardStatus(snapshot),
              const FxHSpacer(
                big: true,
                factor: 2,
              ),
              _audioPlayingStatus(snapshot),
              const FxHSpacer(
                big: true,
                factor: 2,
              ),
              _audioBackwardStatus(snapshot)
            ],
          );
        },
      ),
    );
  }


  Widget _audioPlayingStatus(AsyncSnapshot<PlayerState> snapshot) {
    final playerState = snapshot.data;
    final processingState = playerState?.processingState;

    if (processingState == ProcessingState.loading) {
      return SizedBox(
          width: InitialDims.icon5,
          height: InitialDims.icon5,
          child: CircularProgressIndicator(
            color: InitialStyle.buttonColor,
          ));
    } else if (processingState == ProcessingState.buffering) {
      return SizedBox(
          width: InitialDims.icon5,
          height: InitialDims.icon5,
          child: CircularProgressIndicator(
            color: InitialStyle.buttonColor,
          ));
    } else if (processingState == ProcessingState.ready) {
      if (_isPlaying) {
        return InkWell(
          child: FxSvgIcon(
            "packages/fx_flutterap_components/assets/svgs/pausecircle.svg",
            size: InitialDims.icon5,
            color: InitialStyle.icon,
          ),
          onTap: () {
            _isPlaying = false;
            widget.player.pause();
          },
        );
      } else {
        return InkWell(
          child: FxSvgIcon(
            "packages/fx_flutterap_components/assets/svgs/playcircle.svg",
            size: InitialDims.icon5,
            color: InitialStyle.icon,
          ),
          onTap: () {
            _isPlaying = true;
            widget.player.play();
          },
        );
      }
    } else if (processingState != ProcessingState.completed) {
      return InkWell(
        onTap: widget.player.pause,
        child: FxSvgIcon(
          "packages/fx_flutterap_components/assets/svgs/pausecircle.svg",
          size: InitialDims.icon5,
          color: InitialStyle.icon,
        ),
      );
    } else {
      return InkWell(
        child: RotatedBox(
          quarterTurns: 2,
          child: FxSvgIcon(
            "packages/fx_flutterap_components/assets/svgs/forward.svg",
            size: InitialDims.icon5,
            color: InitialStyle.icon,
          ),
        ),
        onTap: () {
          widget.player.seek(Duration.zero);
          widget.player.pause();
          _isPlaying = false;
        },
      );
    }
  }

  Widget _audioForwardStatus(AsyncSnapshot<PlayerState> snapshot) {
    final playerState = snapshot.data;
    final processingState = playerState?.processingState;
    if (processingState ==
        ProcessingState
            .loading /*||
        processingState == ProcessingState.buffering*/
    ) {
      return Container();
    } else {
      return InkWell(
          child: FxSvgIcon(
            "packages/fx_flutterap_components/assets/svgs/backward5seconds.svg",
            size: InitialDims.icon5,
            color: InitialStyle.icon,
          ),
          onTap: () {
            _movementControl(snapshot, "b");
          });
    }
  }

  Widget _audioBackwardStatus(AsyncSnapshot<PlayerState> snapshot) {
    final playerState = snapshot.data;
    final processingState = playerState?.processingState;
    if (processingState == ProcessingState.loading
    /*||
        processingState == ProcessingState.buffering*/
    ) {
      return Container();
    } else {
      return InkWell(
        child: FxSvgIcon(
          "packages/fx_flutterap_components/assets/svgs/forward10seconds.svg",
          size: InitialDims.icon5,
          color: InitialStyle.icon,
        ),
        // child:FxSvgIcon(
        //   "packages/fx_flutterap_components/assets/svgs/fastforward.svg",
        //   size: InitialDims.icon5,
        //   color: InitialStyle.primaryDarkColor,
        // ),
        onTap: () {
          _movementControl(snapshot, "f");
        },
      );
    }
  }

  void _movementControl(AsyncSnapshot<PlayerState> snapshot, String direction) {
    final playerState = snapshot.data;
    final processingState = playerState?.processingState;
    Duration currentPosition = widget.player.position;
    late Duration targetPosition;

    if (direction == "f") {
      targetPosition = currentPosition + _fastForwardDuration;
    } else if (direction == "b") {
      targetPosition = (currentPosition.inMilliseconds.toDouble() <=
              _fastBackwardDuration.inMilliseconds.toDouble())
          ? const Duration(seconds: 0)
          : (currentPosition - _fastBackwardDuration);
    }

    if (processingState == ProcessingState.ready) {
      widget.player.seek(targetPosition);
      widget.onChanged(targetPosition.inMilliseconds.toDouble());
    }
  }


  void _debugStatusPrinter(AsyncSnapshot<PlayerState> snapshot) {
    final playerState = snapshot.data;
    final processingState = playerState?.processingState;

    if (processingState == ProcessingState.buffering) {
      debugPrint(ProcessingState.buffering.toString());
    }
    if (processingState == ProcessingState.loading) {
      debugPrint("ProcessingState.loading");
    }
    if (processingState == ProcessingState.ready) {
      debugPrint("ProcessingState.ready");
    }
    if (processingState == ProcessingState.completed) {
      debugPrint("ProcessingState.completed");
    }
    if (processingState == ProcessingState.idle) {
      debugPrint("ProcessingState.idle");
    } else {
      debugPrint("");
    }
  }
}
