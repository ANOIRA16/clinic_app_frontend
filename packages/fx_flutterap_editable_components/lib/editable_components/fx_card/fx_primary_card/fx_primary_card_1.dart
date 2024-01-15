import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';

class FxPrimaryCard1 extends StatelessWidget {
  final String? content;

  const FxPrimaryCard1({
    Key? key,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxCard(
      body:  FxText(
        content ?? AppLocalizations.of(context)!.lorem*2,
        align: TextAlign.justify,
        overFlowTag: true,
        maxLine: 8,
      ),
    );
  }
}
