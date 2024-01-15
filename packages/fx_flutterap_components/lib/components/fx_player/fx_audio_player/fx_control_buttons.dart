import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';


import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../fx_text/fx_text.dart';

class FxControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const FxControlButtons(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Opens volume slider dialog
        InkWell(
          child: FxSvgIcon(
            "packages/fx_flutterap_components/assets/svgs/volumehigh.svg",
            size: InitialDims.icon5,
          ),
          onTap: () {
            _showSliderDialog(
              context: context,
              title: "Adjust volume",
              divisions: 10,
              min: 0.0,
              max: 1.0,
              stream: player.volumeStream,
              onChanged: player.setVolume,
            );
          },
        ),

        /// This StreamBuilder rebuilds whenever the player state changes, which
        /// includes the playing/paused state and also the
        /// loading/buffering/ready state. Depending on the state we show the
        /// appropriate button or loading indicator.

        // Opens speed slider dialog
        StreamBuilder<double>(
          stream: player.speedStream,
          builder: (context, snapshot) => InkWell(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FxSvgIcon(
                  "packages/fx_flutterap_components/assets/svgs/Gauge.svg",
                  size: InitialDims.icon3,
                ),
                FxText(
                  "${snapshot.data?.toStringAsFixed(1)}x",tag:Tag.h5,
                  color: InitialStyle.primaryDarkColor,
                ),
              ],
            ),
            onTap: () {
              _showSliderDialog(
                context: context,
                title: "Adjust speed",
                divisions: 10,
                min: 0.5,
                max: 1.5,
                stream: player.speedStream,
                onChanged: player.setSpeed,
              );
            },
          ),
        ),
      ],
    );
  }

  void _showSliderDialog({
    required BuildContext context,
    required String title,
    required int divisions,
    required double min,
    required double max,
    String valueSuffix = '',
    required Stream<double> stream,
    required ValueChanged<double> onChanged,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, textAlign: TextAlign.center),
        content: StreamBuilder<double>(
          stream: stream,
          builder: (context, snapshot) => SizedBox(
            height: 100.0,
            child: Column(
              children: [
                Text('${snapshot.data?.toStringAsFixed(1)}$valueSuffix',
                    style: const TextStyle(
                        fontFamily: 'Fixed',
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0)),
                Slider(
                  divisions: divisions,
                  min: min,
                  max: max,
                  value: snapshot.data ?? 1.0,
                  onChanged: onChanged,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
