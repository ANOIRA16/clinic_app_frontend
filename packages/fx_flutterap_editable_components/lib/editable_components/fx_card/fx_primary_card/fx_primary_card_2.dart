import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxPrimaryCard2 extends StatelessWidget {
  final String? content;
  final String? title;
  final String? subTitle;

  const FxPrimaryCard2({
    Key? key,
    this.content,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxCard(
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText(
            title ?? AppLocalizations.of(context)!.title,
            tag: Tag.h3,
            color: InitialStyle.titleTextColor,
          ),
          // const FxVSpacer(),
          FxText(
            subTitle ?? AppLocalizations.of(context)!.subtitle,
            tag: Tag.h5,
          ),

        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FxVSpacer(),
          FxText(
            content ?? AppLocalizations.of(context)!.lorem*2,
            align: TextAlign.justify,
            overFlowTag: true,
            maxLine: 5,
          ),
        ],
      ),
    );
  }
}
