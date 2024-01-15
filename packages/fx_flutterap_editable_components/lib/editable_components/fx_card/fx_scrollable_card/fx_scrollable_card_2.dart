import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';

class FxScrollableCard2 extends StatelessWidget {
  final String? footer;
  final String? content;

  const FxScrollableCard2({
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
          SizedBox(
            height: (InitialDims.space25),
            child: SingleChildScrollView(
              child: FxText(
                (AppLocalizations.of(context)!.lorem * 4),
                align: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
      footer: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxHDivider(
            top: InitialDims.space2,
            bottom: InitialDims.space2,
          ),
          FxText(
            footer ?? AppLocalizations.of(context)!.footer,
            tag: Tag.h3,
          ),
        ],
      ),
    );
  }
}
