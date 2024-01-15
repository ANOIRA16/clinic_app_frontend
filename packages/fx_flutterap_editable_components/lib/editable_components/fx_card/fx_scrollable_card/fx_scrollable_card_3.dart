import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';

class FxScrollableCard3 extends StatelessWidget {
  final String? header;
  final String? footer;
  final String? content;

  const FxScrollableCard3({
    Key? key,
    this.header,
    this.footer,
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
          FxHDivider(top: InitialDims.space2,bottom: InitialDims.space2,),

        ],
      ),
      body: SizedBox(
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
      ),
      footer: Column(
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
