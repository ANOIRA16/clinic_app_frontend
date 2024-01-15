import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxPrimaryCard7 extends StatelessWidget {
  final String? title;
  final String? buttonText;
  final String? content;

  const FxPrimaryCard7({
    Key? key,
    this.title,
    this.buttonText,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxCard(
      header: FxText(
        title ?? AppLocalizations.of(context)!.title,
        tag:Tag.h3,
        color: InitialStyle.titleTextColor,
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          FxText(
            content ?? AppLocalizations.of(context)!.lorem,
            align: TextAlign.justify,
            overFlowTag: true,
            maxLine: 3,
          ),

        ],
      ),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FxButton(
            text: buttonText ?? AppLocalizations.of(context)!.button,
          ),
        ],
      ),
    );
  }
}
