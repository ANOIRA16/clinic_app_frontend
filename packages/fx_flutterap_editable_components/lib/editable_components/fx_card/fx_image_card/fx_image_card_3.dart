import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';

class FxImageCard3 extends StatelessWidget {
  final String? imagePath;
  final String? content;

  const FxImageCard3({
    Key? key,
    this.imagePath,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxCard(
      padding: EdgeInsets.all(InitialDims.space0),
      bodyPadding: EdgeInsets.all(InitialDims.space0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              imagePath ??
                  "packages/fx_flutterap_components/assets/images/img2.jpg",
              fit: BoxFit.cover,
            ),
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
                  content ?? AppLocalizations.of(context)!.lorem,
                  align: TextAlign.justify,
                  overFlowTag: true,
                  maxLine: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
