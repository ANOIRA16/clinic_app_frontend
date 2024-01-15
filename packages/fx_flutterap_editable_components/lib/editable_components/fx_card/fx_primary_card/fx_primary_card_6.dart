import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_icon_text.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxPrimaryCard6 extends StatelessWidget {
  final String? title;
  final String? quotation;
  final String? content;

  const FxPrimaryCard6({
    Key? key,
    this.title,
    this.quotation,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxCard(
      header:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText(
            title ?? AppLocalizations.of(context)!.quotation,tag:Tag.h3,
          ),
          FxHDivider(top: InitialDims.space2,bottom: InitialDims.space2,),

        ],
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          FxText(
            content ?? AppLocalizations.of(context)!.lorem,
            align: TextAlign.justify,
            overFlowTag: true,
            maxLine: 2,
          ),
          const FxVSpacer(
            big: true,
            factor: 2,
          ),
          FxIconText(
            quotation ?? AppLocalizations.of(context)!.loremmid,
            overFlowTag: true,
            maxLine: 1,
            icon: Icon(
              Icons.minimize,
              color: InitialStyle.textColor,
            ),
          ),
          const FxVSpacer(
            big: true,
            factor: 2,
          ),
        ],
      ),
    );
  }
}
