import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxImageCard6 extends StatelessWidget {
  final String? imagePath;
  final String? header;
  final String? content;

  const FxImageCard6({
    Key? key,
    this.imagePath,
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
            color: InitialStyle.titleTextColor,
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
          Container(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.symmetric(
              vertical: InitialDims.space2,
            ),
            decoration: BoxDecoration(
                color: InitialStyle.cardColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(InitialDims.border3))),
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                imagePath ??
                    "packages/fx_flutterap_components/assets/images/img2.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const FxVSpacer(
            big: true,
            factor: 2,
          ),
          FxText(
            content ?? AppLocalizations.of(context)!.lorem,
            align: TextAlign.justify,
            tag: Tag.h4,
            overFlowTag: true,
            maxLine: 3,
          ),
        ],
      ),
    );
  }
}
