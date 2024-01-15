import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_icon_button.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card_header.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class FxProgressProfileCard extends StatelessWidget {
  final double? percent;
  final void Function()? editFunction;

  const FxProgressProfileCard({
    Key? key,
    this.percent,
    this.editFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String percent0 = "${percent ?? 70}%";

    return FxCard(
      padding: EdgeInsets.symmetric(
        vertical: InitialDims.space3,
        horizontal: InitialDims.space3,
      ),
      margin: EdgeInsets.all(InitialDims.space0),
      header: FxCardHeader(
        title: AppLocalizations.of(context)!.completetheprofile,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 14,
            child: LinearPercentIndicator(
              padding: const EdgeInsets.all(0),
              barRadius: Radius.circular(InitialDims.icon3),
              animation: true,
              animationDuration: 1000,
              lineHeight: InitialDims.icon3,
              percent: (percent ?? 70) / 100,
              center: FxText(
                percent0,
                tag: Tag.h5,
                color: InitialStyle.primaryLightColor,
              ),
              progressColor: InitialStyle.primaryDarkColor,
              backgroundColor: InitialStyle.disableColorLight,
            ),
          ),
          const FxHSpacer(
            big: true,
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: FxIconButton(
                Icon(
                  Icons.edit,
                  color: InitialStyle.primaryLightColor,
                  size: InitialDims.icon2,
                ),
                onTap: editFunction,
              ),
            ),
          )
        ],
      ),
    );
  }
}
