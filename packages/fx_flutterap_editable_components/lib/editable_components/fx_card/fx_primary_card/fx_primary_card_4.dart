import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';

class FxPrimaryCard4 extends StatelessWidget {
  final String? footer;
  final String? content;

  const FxPrimaryCard4({
    Key? key,
    this.footer,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxCard(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText(
            content ?? AppLocalizations.of(context)!.lorem,
            align: TextAlign.justify,
            overFlowTag: true,
            maxLine: 5,
          ),


        ],
      ),
      footer:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          FxHDivider(top: InitialDims.space2,bottom: InitialDims.space2,),
          FxText(
            footer ?? AppLocalizations.of(context)!.footer,
            tag: Tag.h3,
          ),
        ],
      ),
    );
  }
}
