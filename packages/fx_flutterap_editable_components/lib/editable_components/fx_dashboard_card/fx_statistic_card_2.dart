// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';

import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_config.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card_decoration.dart';
import 'package:fx_flutterap_template/default_template/components/fx_item_indicator_icon.dart';

class FxStatisticCard2 extends StatelessWidget {
  final String? imagePath;
  final String? description;
  final String? number;
  final String? changePercent;
  final bool? hasGrown;

  const FxStatisticCard2({
    Key? key,
    this.imagePath,
    this.description,
    this.number,
    this.changePercent,
    this.hasGrown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: FxCardDecoration().decoration,
      height: (InitialDims.space20) *3,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: InitialDims.space5,
          vertical: InitialDims.space5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            FxItemIndicatorIcon(
              iconPath: imagePath ??
                  "packages/fx_flutterap_components/assets/svgs/shoppingcart.svg",
            ),
            FxVSpacer(
              big: true,

            ),
            FxText(
              number ?? "313",
              align: TextAlign.justify,
              tag:Tag.h2,
              color: InitialStyle.titleTextColor,
              isBold: true,
              overFlowTag: true,
              maxLine: 3,
            ),
            FxText(
              description ?? InitialConfig.lorem,
              align: TextAlign.justify,
              tag:Tag.h4,
              color: InitialStyle.titleTextColor,
              overFlowTag: true,
              maxLine: 3,
            ),
            FxVSpacer(
              big: true,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                hasGrown ?? true
                    ? FxSvgIcon(
                        "packages/fx_flutterap_components/assets/svgs/arrowup2.svg",
                        size: InitialDims.icon2,
                        color: InitialStyle.successColorRegular,
                      )
                    : FxSvgIcon(
                        "packages/fx_flutterap_components/assets/svgs/arrowdown2.svg",
                        size: InitialDims.icon2,
                        color: InitialStyle.dangerColorRegular,
                      ),
                FxHSpacer(
                  big: true,
                ),
                FxText(
                  changePercent ?? "2.5%",tag:Tag.h6,
                  color: hasGrown ?? true
                      ? InitialStyle.successColorRegular
                      : InitialStyle.dangerColorRegular,
                  align: TextAlign.justify,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
