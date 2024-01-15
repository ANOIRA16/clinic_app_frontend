import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxSeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;
  final ValueChanged<Duration> onChanged;
  final ValueChanged<Duration> onChangeEnd;

  const FxSeekBar({
    Key? key,
    required this.duration,
    required this.position,
    required this.bufferedPosition,
    required this.onChanged,
    required this.onChangeEnd,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxSeekBarState();
  }
}

class _FxSeekBarState extends State<FxSeekBar> {
  late SliderThemeData _sliderThemeData;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sliderThemeData = SliderTheme.of(context).copyWith(
      trackHeight: 2.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SliderTheme(
          data: _sliderThemeData.copyWith(
              inactiveTrackColor: Colors.transparent,
              activeTrackColor: InitialStyle.secondaryDarkColor,
              thumbColor: Colors.transparent,
              thumbShape: SliderComponentShape.noThumb),
          child: ExcludeSemantics(
            child: Slider(
              min: 0.0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: min(widget.bufferedPosition.inMilliseconds.toDouble(),
                  widget.duration.inMilliseconds.toDouble()),
              onChanged: (value) {
                widget.onChanged(Duration(milliseconds: value.round()));
              },
              onChangeEnd: (value) {
                widget.onChangeEnd(Duration(milliseconds: value.round()));
                // _dragValue = 0;//null
              },
            ),
          ),
        ),
        SliderTheme(
          data: _sliderThemeData.copyWith(
            activeTrackColor: InitialStyle.buttonColor,
            inactiveTrackColor: InitialStyle.backgroundInput,
            thumbColor: InitialStyle.buttonColor,
          ),
          child: Slider(
            min: 0.0,
            max: widget.duration.inMilliseconds.toDouble(),
            value: min(widget.position.inMilliseconds.toDouble(),
                widget.duration.inMilliseconds.toDouble()),
            onChanged: (value) {
              widget.onChanged(Duration(milliseconds: value.round()));
            },
            onChangeEnd: (value) {
              widget.onChangeEnd(Duration(milliseconds: value.round()));

              // _dragValue = 0.0;
            },
          ),
        ),
        Positioned(
          right: 16.0,
          bottom: 0.0,
          child: FxText(
            RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                    .firstMatch("$_remaining")
                    ?.group(1) ??
                '$_remaining',tag: Tag.h5,
          ),
        ),
      ],
    );
  }

  Duration get _remaining => widget.duration - widget.position;
}
