//
// import 'package:dart_vlc/dart_vlc.dart';
// import 'package:flutter/material.dart';
// import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
// import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
//
//
//
// class FxDesktopVideoPlayer extends StatefulWidget {
//   final String videoUrl;
//
//
//   const FxDesktopVideoPlayer({Key? key,
//     required this.videoUrl,
//
//   }) : super(key: key);
//
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return  _FxDesktopVideoPlayerState();
//   }
// }
//
// class _FxDesktopVideoPlayerState extends State<FxDesktopVideoPlayer> {
//   Player player = Player(
//     id: 0,
//     videoDimensions: const VideoDimensions(640, 360),
//   );
//   late String videoURL;
//
//
//   CurrentState current = CurrentState();
//   PositionState position = PositionState();
//   PlaybackState playback = PlaybackState();
//   GeneralState general = GeneralState();
//   VideoDimensions videoDimensions = VideoDimensions(0, 0);
//
//   List<Device> devices = <Device>[];
//   TextEditingController controller = TextEditingController();
//   TextEditingController metasController = TextEditingController();
//   double bufferingProgress = 0.0;
//   Media? metadataCurrentMedia;
//
//
//   @override
//   void initState() {
//     super.initState();
//     List<Media> medias = <Media>[
//       Media.network(
//           widget.videoUrl),
//
//     ];
//     if (mounted) {
//       player.currentStream.listen((value) {
//         setState(() => current = value);
//       });
//       player.positionStream.listen((value) {
//         setState(() => position = value);
//       });
//       player.playbackStream.listen((value) {
//         setState(() => playback = value);
//       });
//       player.generalStream.listen((value) {
//         setState(() => general = value);
//       });
//       player.videoDimensionsStream.listen((value) {
//         setState(() => videoDimensions = value);
//       });
//       player.bufferingProgressStream.listen(
//             (value) {
//           setState(() => bufferingProgress = value);
//         },
//       );
//       player.errorStream.listen((event) {
//         debugPrint('libVLC error.');
//       });
//       devices = Devices.all;
//       Equalizer equalizer = Equalizer.createMode(EqualizerMode.live);
//       equalizer.setPreAmp(10.0);
//       equalizer.setBandAmp(31.25, 10.0);
//       player.setEqualizer(equalizer);
//     }
//     player.open(
//         Playlist(medias: medias),
//         autoStart: false
//     );
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//
//     return AspectRatio(
//       aspectRatio: 16 / 9,
//       child: Card(
//
//           margin: EdgeInsets.symmetric(
//             vertical: InitialDims.space1,
//             horizontal: InitialDims.space1,
//           ),
//           clipBehavior: Clip.antiAlias,
//           shape: RoundedRectangleBorder(
//             borderRadius:  BorderRadius.all(
//               Radius.circular(InitialDims.border5),
//
//             ),
//           ),
//           color: InitialStyle.black,
//
//           child: Video(
//             player: player,
//
//             volumeThumbColor: Colors.blue,
//             volumeActiveColor: Colors.blue,
//             showControls: true,
//           )
//       ),
//     );
//   }
// }
//
//
// /*import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_meedu_videoplayer/meedu_player.dart';
//
// class FxDesktopVideoPlayer extends StatefulWidget {
//   const FxDesktopVideoPlayer({Key? key}) : super(key: key);
//
//   @override
//   State<FxDesktopVideoPlayer> createState() => _FxDesktopVideoPlayerState();
// }
//
// class _FxDesktopVideoPlayerState extends State<FxDesktopVideoPlayer> {
//   final _meeduPlayerController = MeeduPlayerController(
//     controlsStyle: ControlsStyle.primary,
//     // enabledButtons: const EnabledButtons(pip: true),
//     // enabledControls: const EnabledControls(doubleTapToSeek: false),
//     // pipEnabled: true,
//     // header: header
//   );
//
//   StreamSubscription? _playerEventSubs;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _init();
//     });
//   }
//
//   @override
//   void dispose() {
//     _playerEventSubs?.cancel();
//     _meeduPlayerController.dispose();
//     super.dispose();
//   }
//
//   _init() async {
//     await _meeduPlayerController.setDataSource(
//         DataSource(
//           type: DataSourceType.network,
//           source:
//           "https://movietrailers.apple.com/movies/paramount/the-spongebob-movie-sponge-on-the-run/the-spongebob-movie-sponge-on-the-run-big-game_h720p.mov",
//         ),
//         autoplay: true,
//         looping: false);
//   }
//
//   Widget get header {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       child: Row(
//         children: [
//           CupertinoButton(
//             child: const Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               // close the fullscreen
//               Navigator.maybePop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 16 / 9,
//       child: MeeduVideoPlayer(
//         controller: _meeduPlayerController,
//         header: (context, controller, responsive) => header,
//       ),
//     );
//   }
// }*/
//
