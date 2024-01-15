import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxImageCard5 extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? content;
  final String? lastUpdateString;

  const FxImageCard5({
    Key? key,
    this.imagePath,
    this.title,
    this.content,
    this.lastUpdateString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxCard(
      padding: EdgeInsets.all(InitialDims.space0),
      bodyPadding: EdgeInsets.all(InitialDims.space0),
      body:  Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imagePath ?? "packages/fx_flutterap_components/assets/images/img2.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: InitialDims.space5,
              vertical: InitialDims.space5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText(
                  title ?? AppLocalizations.of(context)!.title,
                  tag:Tag.h3,
                  color: InitialStyle.titleTextColor,
                ),
                const FxVSpacer(
                  big: true,
                  factor: 2,
                ),
                FxText(
                  content ?? AppLocalizations.of(context)!.lorem,
                  align: TextAlign.justify,
                  overFlowTag: true,
                  maxLine: 3,
                ),
                const FxVSpacer(
                  big: true,
                  factor: 2,
                ),
                FxText(
                  lastUpdateString??AppLocalizations.of(context)!.lastupdatewas,
                  tag:Tag.h5,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
