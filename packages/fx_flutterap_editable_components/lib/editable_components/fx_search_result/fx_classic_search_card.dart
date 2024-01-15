import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_label/fx_content_label.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';

import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxClassicSearchCard extends StatelessWidget {
  final String? title;
  final String? content;
  final Widget? label;
  final String? date;

  const FxClassicSearchCard({
    Key? key,
    this.title,
    this.content,
    this.label,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(InitialDims.space2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FxVSpacer(
              big: true,
            ),
            FxText(
              title ?? AppLocalizations.of(context)!.loremmid,
              tag:Tag.h3,
              color: InitialStyle.titleTextColor,
              align: TextAlign.start,
            ),
            const FxVSpacer(),
            FxText(
              content ?? AppLocalizations.of(context)!.lorem,
              align: TextAlign.start,
            ),
            const FxVSpacer(big: true),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                label ??
                    FxContentLabel(
                      isUnique: true,
                      size: InitialDims.icon3,
                      color: InitialStyle.dangerColorDark,
                      textColor: Colors.white,
                      text: AppLocalizations.of(context)!.error,
                    ),
                const FxHSpacer(
                  big: true,
                ),
                Icon(
                  Icons.circle,
                  size: (InitialDims.icon3) / 4,
                  color: InitialStyle.secondaryTextColor,
                ),
                const FxHSpacer(),
                FxText(
                  date ?? "20.10.2018 ",
                  color: InitialStyle.secondaryTextColor,
                )
              ],
            ),
            const FxVSpacer(
              big: true,
              factor: 3,
            ),
            const FxHDivider()
          ],
        ));
  }
}
