import 'package:flutter/material.dart';

import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card_decoration.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:fx_flutterap_template/default_template/components/fx_item_indicator_icon.dart';

class FxStatisticCard1 extends StatelessWidget {
  final String? imagePath;
  final String? description;
  final String? number;

  const FxStatisticCard1({
    Key? key,
    this.imagePath,
    this.description,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration:FxCardDecoration().decoration,
      child:  Padding(
        padding:  EdgeInsets.all(InitialDims.space3),
        child: Row(
          children: [
            FxItemIndicatorIcon(iconPath:imagePath ??
                "packages/fx_flutterap_components/assets/svgs/shoppingcart.svg",),
            const FxHSpacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             children: [

               FxText(number??"Total income",
                 color: InitialStyle.titleTextColor,
                 size: InitialDims.midTitleFontSize,
                 isBold: true,
               ),

               FxText(description??"lorem ipsum lorem ipsum",
                 color: InitialStyle.textColor,
                 tag:Tag.h4,

               )
             ],
            )
          ],
        ),
      ),
    );
  }
}
