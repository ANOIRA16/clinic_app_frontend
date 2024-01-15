import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';

import 'fx_video_player.dart';

import 'package:intl/intl.dart' as intl;

class FxVideoCard extends StatefulWidget {
  final String videoUrl;
  final String videoTitle;
  final String videoDescription;
  final bool hasCover;
  final Widget? forwardIcon;
  final Widget? backwardIcon;
  final Duration? fastForwardDuration;
  final Duration? fastBackwardDuration;

  const FxVideoCard({
    Key? key,
    required this.videoUrl,
    required this.videoTitle,
    required this.videoDescription,
    required this.hasCover,
    this.backwardIcon,
    this.forwardIcon,
    this.fastForwardDuration,
    this.fastBackwardDuration,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxVideoCardState();
  }
}

class _FxVideoCardState extends State<FxVideoCard> {
  @override
  Widget build(BuildContext context) {
    bool isDirectionRTL(BuildContext context) {
      return intl.Bidi.isRtlLanguage(
          Localizations.localeOf(context).languageCode);
    }

    bool rtl = isDirectionRTL(context);

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          vertical: InitialDims.space1,
          horizontal: InitialDims.space1,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: InitialStyle.black,
          borderRadius: BorderRadius.all(
            Radius.circular(InitialDims.border5),
          ),
        ),
        child: FxVideoPlayer(
          videoUrl: widget.videoUrl,
          playIcon: FxSvgIcon(
            "packages/fx_flutterap_components/assets/svgs/play.svg",
            size: InitialDims.icon5,
            color: InitialStyle.icon,
          ),
          forwardIcon: widget.forwardIcon,
          backwardIcon: widget.backwardIcon,
          fastForwardDuration: widget.fastForwardDuration,
          fastBackwardDuration: widget.fastBackwardDuration,
          videoCover: widget.hasCover
              ? Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.1, 1],
                          colors: [
                            Colors.transparent,
                            InitialStyle.primaryLightColor
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: InitialDims.space5,
                      right: InitialDims.space5,
                      left: InitialDims.space5,
                      child: SizedBox(
                        width: 14 * (InitialDims.space5),
                        child: Column(
                          crossAxisAlignment: rtl
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            FxText(
                              widget.videoTitle,
                              tag: Tag.h3,
                              color: InitialStyle.primaryDarkColor,
                              isBold: true,
                              size: InitialDims.normalFontSize,
                            ),
                            SizedBox(
                              height: InitialDims.space2,
                            ),
                            FxText(
                              widget.videoDescription,
                              height: 1.5,
                              align: TextAlign.justify,
                              color: InitialStyle.primaryDarkColor,
                              overFlowTag: true,
                              maxLine: 2,
                              // size: Dims.smallFontSize(context),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}
