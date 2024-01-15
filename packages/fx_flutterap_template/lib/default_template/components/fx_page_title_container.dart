import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import '../structure/structure_dims.dart';
import '../structure/structure_styles.dart';
import 'fx_card_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FxPageTitleContainer extends StatelessWidget {
  final String description;
  final GlobalKey? descriptionKey;
  final String? information;
  final GlobalKey? informationKey;

  const FxPageTitleContainer({Key? key,
    required this.description,
    this.descriptionKey,
    this.information,
    this.informationKey,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: descriptionKey,
      padding: EdgeInsets.symmetric(
        vertical: InitialDims.space3,
        horizontal: InitialDims.space3,
      ),
      margin: EdgeInsets.only(
        top: InitialDims.space6,
        left: InitialDims.space5,
        right: InitialDims.space5,
        bottom: InitialDims.space1,
      ),

      width: double.maxFinite,
      decoration: BoxDecoration(
        color: InitialStyle.section,
        borderRadius:
        BorderRadius.all(Radius.circular((InitialDims.border3))),
        boxShadow: [
          BoxShadow(
            color: InitialStyle.shadow,
            blurRadius: 24.0,
          ),
        ],
      ),
      ////////////////////////
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxCardHeader(
            title: AppLocalizations.of(context)!.information,
            information: information,
          ),
          const FxVSpacer(),
          FxText(description,
            size: InitialDims.normalFontSize,
          )
        ],
      ),
    );
  }
}


