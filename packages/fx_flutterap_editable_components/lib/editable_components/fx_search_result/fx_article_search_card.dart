import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxArticleSearchCard extends StatelessWidget {
  final String? imagePath;
  final String? content;

  const FxArticleSearchCard({
    Key? key,
    this.imagePath,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: (InitialDims.space20) * 3,
      margin: EdgeInsets.symmetric(
        vertical: InitialDims.space2,
      ),
      decoration: BoxDecoration(
          color: InitialStyle.cardColor,
          borderRadius:
              BorderRadius.all(Radius.circular(InitialDims.border3))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath ?? "packages/fx_flutterap_components/assets/images/img2.jpg",
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: InitialDims.space5,
              vertical: InitialDims.space5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FxVSpacer(
                  big: true,
                  factor: 2,
                ),
                FxText(
                  content ??  AppLocalizations.of(context)!.lorem,
                  align: TextAlign.justify,
                  overFlowTag: true,
                  maxLine: 3,
                ),
                const FxVSpacer(
                  big: true,
                  factor: 2,
                ),
                InkWell(
                  onTap: () {},
                  child: FxText(
                    AppLocalizations.of(context)!.readmore,
                    tag:Tag.h5,
                    color: InitialStyle.titleTextColor,
                    isBold: true,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
