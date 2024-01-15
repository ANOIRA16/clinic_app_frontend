import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';

class FxScrollableCard1 extends StatelessWidget {
  final String? header;
  final String? content;

  const FxScrollableCard1({
    Key? key,
    this.header,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxCard(
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText(
            header ?? AppLocalizations.of(context)!.header,
            tag: Tag.h3,
          ),
          FxHDivider(
            top: InitialDims.space2,
            bottom: InitialDims.space2,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: (InitialDims.space25),
            child: SingleChildScrollView(
              child: FxText(
                content ??
                    (AppLocalizations.of(context)!.lorem +
                        AppLocalizations.of(context)!.lorem +
                        AppLocalizations.of(context)!.lorem +
                        AppLocalizations.of(context)!.lorem),
                align: TextAlign.justify,
              ),
            ),
          )
        ],
      ),
    );
  }
}
