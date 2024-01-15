import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../fx_image/fx_svg_icon.dart';

class FxCustomToastContainer extends StatelessWidget {
  final Color? backGroundColor;
  final Color? contentColor;
  final EdgeInsetsGeometry? padding;
  final bool? hasProgressBar;
  final Duration? duration;
  final Widget? content;
  final Widget? icon;

  const FxCustomToastContainer({
    Key? key,
    this.backGroundColor,
    this.contentColor,
    this.padding,
    this.hasProgressBar,
    this.duration,
    this.content,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int duration0 =
        (duration ?? const Duration(milliseconds: 2000)).inMilliseconds;

    return Container(
      width: (InitialDims.space25) * 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(InitialDims.border2),
        boxShadow: [
          BoxShadow(
            color: contentColor ?? InitialStyle.successColorDark,
            // blurRadius: 2.0,

            offset: const Offset(-5, 0),
          ),
        ],
        color: backGroundColor ?? InitialStyle.successColorLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: padding ??
                EdgeInsets.symmetric(
                    horizontal: InitialDims.space2,
                    vertical: InitialDims.space2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon ??
                    FxSvgIcon(
                      "packages/fx_flutterap_components/assets/svgs/CheckCircle.svg",
                      size: InitialDims.icon5,
                      color: contentColor ?? InitialStyle.successColorDark,
                    ),
                const FxHSpacer(
                  big: true,
                  factor: 3,
                ),
                content ??
                    FxText(
                      "This is a Custom Toast",
                      tag: Tag.h5,
                      color: contentColor ?? InitialStyle.successColorDark,
                    ),
              ],
            ),
          ),
          hasProgressBar ?? true
              ? LinearPercentIndicator(
                  barRadius: Radius.circular(InitialDims.icon3),
                  animation: true,
                  animationDuration: duration0,
                  lineHeight: InitialDims.icon1,
                  percent: 100 / 100,
                  progressColor: contentColor ?? InitialStyle.successColorDark,
                  backgroundColor:
                      backGroundColor ?? InitialStyle.successColorLight,
                )
              : Container(),
        ],
      ),
    );
  }
}
