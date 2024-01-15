import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';

class FxDesktopAudioPlayer extends StatefulWidget {
  final Duration? fastForwardDuration;
  final Duration? fastBackwardDuration;
  final String audioUrl;

  const FxDesktopAudioPlayer({
    Key? key,
    this.fastForwardDuration,
    this.fastBackwardDuration,
    required this.audioUrl,
  }) : super(key: key);

  @override
  State<FxDesktopAudioPlayer> createState() => _FxDesktopAudioPlayerState();
}

class _FxDesktopAudioPlayerState extends State<FxDesktopAudioPlayer> {
  Duration _fastForwardDuration = const Duration(seconds: 10);
  Duration _fastBackwardDuration = const Duration(seconds: -5);
  Duration _position = Duration.zero;

  int _maxduration = 1000000;
  int _currentpos = 0;

  String currentpostlabel = "00:00";
  String _maxdurationlabel = "00:00";

  bool _isplaying = false;
  bool _audioplayed = false;

  late SliderThemeData _sliderThemeData;
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    _fastForwardDuration =
        widget.fastForwardDuration ?? const Duration(seconds: 10);
    _fastBackwardDuration =
        widget.fastBackwardDuration ?? const Duration(seconds: -5);
    Future.delayed(Duration.zero, () async {
      // ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
      // audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      // //convert ByteData to Uint8List
      // await player.play(BytesSource(audiobytes));
      _player.onDurationChanged.listen((Duration d) {
        //get the duration of audio
        if(d>=Duration.zero){

          _maxduration = d.inMilliseconds;
        }

        int shours = Duration(milliseconds: _maxduration).inHours;
        int sminutes = Duration(milliseconds: _maxduration).inMinutes;
        int sseconds = Duration(milliseconds: _maxduration).inSeconds;

        int rhours = shours;
        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        _maxdurationlabel = "$rhours:$rminutes:$rseconds";
        setState(() {});
      });

      _player.onPositionChanged.listen((Duration p) {
        _currentpos =
            p.inMilliseconds; //get the current position of playing audio

        //generating the duration label
        int shours = Duration(milliseconds: _currentpos).inHours;
        int sminutes = Duration(milliseconds: _currentpos).inMinutes;
        int sseconds = Duration(milliseconds: _currentpos).inSeconds;

        int rhours = shours;
        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        currentpostlabel = "$rhours:$rminutes:$rseconds";
        _position = p;
        setState(() {
          //refresh the UI

        });
      });
    });
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
  void dispose() {
    // TODO: implement dispose
    _player.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxText(currentpostlabel),
              FxText(_maxdurationlabel),
            ],
          ),
          SliderTheme(
            data: _sliderThemeData.copyWith(
              activeTrackColor: InitialStyle.textColor,
              inactiveTrackColor: InitialStyle.secondaryDarkColor,
              thumbColor: InitialStyle.primaryDarkColor,
            ),
            child: ExcludeSemantics(
              child: Slider(
                value: double.parse(_currentpos.toString()),
                min: 0,
                max: double.parse((_maxduration).toString()),
                // max: double.parse(maxduration.toString()),
                // divisions: maxduration,
                label: currentpostlabel,
                onChanged: (double value) async {
                  int seekval = value.round();
                  await _player.seek(Duration(milliseconds: seekval));
                },
              ),
            ),
          ),
          Wrap(
            spacing: InitialDims.space5,
            children: [
              InkWell(
                onTap: () async {
                  if (_position.inMilliseconds <= 5000) {
                    await _player.seek(Duration.zero);
                  } else {
                    await _player.seek(_fastBackwardDuration + _position);
                  }

                  setState(() {});
                },
                child: FxSvgIcon(
                  "packages/fx_flutterap_components/assets/svgs/backward5seconds.svg",
                  size: InitialDims.icon5,
                  color: InitialStyle.icon,
                ),
              ),
              InkWell(
                onTap: () async {

                  if (!_isplaying && !_audioplayed) {

                    Future.delayed(const Duration(milliseconds: 0), () async {
                      _palyFunc();
                    });
                    setState(() {
                      _isplaying = true;
                      _audioplayed = true;
                    });
                  }
                  else if (_audioplayed && !_isplaying) {

                    await _player.resume();

                    if (!_isplaying) {
                      //resume success
                      setState(() {
                        _isplaying = true;
                        _audioplayed = true;
                      });

                    }
                    else {
                      if (kDebugMode) {
                        print("Error on resume audio.");
                      }
                    }
                  }
                  else {
                    await _player.pause();
                    if (_isplaying) {
                      //pause success
                      setState(() {
                        _isplaying = false;
                      });
                    } else {
                      if (kDebugMode) {
                        print("Error on pause audio.");
                      }
                    }
                  }
                },
                child: _isplaying
                    ? FxSvgIcon(
                        "packages/fx_flutterap_components/assets/svgs/pausecircle.svg",
                        size: InitialDims.icon5,
                        color: InitialStyle.icon,
                      )
                    : FxSvgIcon(
                        "packages/fx_flutterap_components/assets/svgs/playcircle.svg",
                        size: InitialDims.icon5,
                        color: InitialStyle.icon,
                      ),
              ),
              InkWell(
                onTap: () async {
                  await _player.seek(_fastForwardDuration + _position);

                  setState(() {});
                },
                child: FxSvgIcon(
                  "packages/fx_flutterap_components/assets/svgs/forward10seconds.svg",
                  size: InitialDims.icon5,
                  color: InitialStyle.icon,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _palyFunc() async {
    await _player.play(UrlSource(widget.audioUrl));
  }
}
