import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card_header.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class FxProgressListCard extends StatelessWidget {
  final String? title;
  final List<double>? percentList;
  final List<String>? titleList;
  final List<Color>? colorList;

  const FxProgressListCard({
    Key? key,
    this.title,
    this.percentList,
    this.titleList,
    this.colorList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> titleList0 = titleList ?? [];
    List<double> percentList0 = percentList ??
        List.generate(
          titleList0.length,
          (index) => 70,
        );
    List<String> percentListString0 =
        List.generate(titleList0.length, (index) => "${percentList0[index]}%");

    List<Color> colorList0 = colorList ??
        List.generate(
          titleList0.length,
          (index) => InitialStyle.primaryDarkColor,
        );

    return FxCard(
      padding: EdgeInsets.symmetric(
        vertical: InitialDims.space3,
        horizontal: InitialDims.space3,
      ),
      margin: EdgeInsets.all(InitialDims.space0),
      height: (InitialDims.space20) * 3,
      header:  FxCardHeader(
        title: title ?? AppLocalizations.of(context)!.skills,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ...List.generate(
              titleList0.length,
              (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FxVSpacer(),
                      FxText(
                        titleList0[index],
                        tag: Tag.h5,
                        color: InitialStyle.textColor,
                      ),
                      const FxVSpacer(
                        factor: 0.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            // flex: 17,
                            child: LinearPercentIndicator(
                              padding: const EdgeInsets.all(0),
                              barRadius: Radius.circular(InitialDims.icon3),
                              animation: true,
                              animationDuration: 1000,
                              lineHeight: InitialDims.icon3,
                              percent: (percentList0[index]) / 100,
                              center: FxText(
                                percentListString0[index],
                                tag: Tag.h5,
                                color: InitialStyle.textColor,
                              ),
                              progressColor: colorList0[index],
                              backgroundColor: InitialStyle.disableColorLight,
                            ),
                          ),
                          const FxHSpacer(
                            big: true,
                          ),
                        ],
                      ),
                    ],
                  ))
        ],
      ),
    );
  }
}
