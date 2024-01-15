import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import 'fx_control_buttons.dart';
import 'fx_play_buttons.dart';
import 'fx_seek_bar.dart';

class FxAudioPlayer extends StatefulWidget {
  // FxAudioPlayer() {
  //   if (!kIsWeb) {
  //     clearDiskCachedImages(duration: const Duration(seconds: 1000));
  //   }
  // }

  final String audioURL;
  final bool autoplay;
  final Duration? fastForwardDuration;
  final Duration? fastBackwardDuration;

  const FxAudioPlayer({
    Key? key,
    required this.audioURL,
    required this.autoplay,
    this.fastForwardDuration,
    this.fastBackwardDuration,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxAudioPlayerState();
  }
}

class _FxAudioPlayerState extends State<FxAudioPlayer> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    _player.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display play/pause button and volume/speed sliders.
          FxControlButtons(_player),
          // Display seek bar. Using StreamBuilder, this widget rebuilds
          // each time the position, buffered position or duration changes.
          StreamBuilder<PositionData>(
            stream: _positionDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return FxSeekBar(
                duration: positionData?.duration ?? Duration.zero,
                position: positionData?.position ?? Duration.zero,
                bufferedPosition:
                    positionData?.bufferedPosition ?? Duration.zero,
                onChangeEnd: _player.seek,
                onChanged: (Duration value) {},
              );
            },
          ),

          FxPlayButtons(
              player: _player,
              fastForwardDuration: widget.fastForwardDuration,
              fastBackwardDuration: widget.fastBackwardDuration,
              onChanged: (value) {
                setState(() {});
              })
        ],
      ),
    );
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      if (kDebugMode) {
        print('A stream error occurred: $e');
      }
    });
    // Try to load audio from a source and catch any errors.
    try {
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(widget.audioURL),
          //tag: MediaItem(
          // Specify a unique ID for each media item:
          //  id: '1',
          // Metadata to display in the notification:
          //  album: widget.albumName,
          //  title: widget.titleName,
          //  artUri: Uri.parse(widget.imageURL),
          //  ),
        ),
      );
      if (widget.autoplay) {
        _player.play();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error loading audio source: $e");
      }
    }
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));
}

/// Displays the play/pause button and volume/speed sliders.

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}
