// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxMostSalesCard extends StatelessWidget {
  final List<String> nameList;
  final List<String>? amountList;
  final List<String>? rateList;
  final List<bool>? isIncresedList;

  const FxMostSalesCard({
    Key? key,
    required this.nameList,
    this.amountList,
    this.rateList,
    this.isIncresedList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> amountList0 = amountList ??
        List.generate(
          nameList.length,
          (index) => "18,879",
        );

    List<String> rateList0 = rateList ??
        List.generate(
          nameList.length,
          (index) => "2.5%",
        );

    List<bool> isIncresedList0 = isIncresedList ??
        List.generate(
          nameList.length,
          (index) => true,
        );

    return Container(
      height: (InitialDims.space25) * 4,
      padding: EdgeInsets.symmetric(
        horizontal: InitialDims.space1,
        vertical: InitialDims.space1,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FxText(
                  "313,313",
                  color: InitialStyle.titleTextColor,
                  tag:Tag.h2,
                  isBold: true,
                ),
                const FxHSpacer(
                  factor: 2,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FxSvgIcon(
                      "packages/fx_flutterap_components/assets/svgs/arrowup2.svg",
                      size: InitialDims.icon2,
                      color: InitialStyle.successColorRegular,
                    ),
                    FxText(
                      "25%",
                      tag:Tag.h6,
                      color: InitialStyle.successColorRegular,
                      align: TextAlign.justify,
                    ),
                  ],
                ),
              ],
            ),
            const FxVSpacer(),
            FxText(
              AppLocalizations.of(context)!.saleslast90days,
              tag:Tag.h4,
            ),
            const FxVSpacer(
              factor: 2,
            ),
            FxHDivider(),
            ...List.generate(
                nameList.length,
                (index) => _sttisticCards(index, nameList, amountList0,
                    rateList0, isIncresedList0, context))
          ],
        ),
      ),
    );
  }

  Widget _sttisticCards(
      int index,
      List<String> widgetNameList,
      List<String> widgetAmountList,
      List<String> widgetRateList,
      List<bool> widgetIsIncreasedList,
      BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(
              vertical: InitialDims.space3,
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: FxText(
                      widgetNameList[index],tag:Tag.h5,
                      size: InitialDims.subtitleFontSize,
                      align: TextAlign.start,
                    )),
                Expanded(
                    flex: 3,
                    child: FxText(
                      widgetAmountList[index],tag:Tag.h5,
                      color: InitialStyle.titleTextColor,
                      align: TextAlign.start,
                      isBold: true,
                    )),
                Expanded(
                    flex: 1,
                    child: widgetIsIncreasedList[index]
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              FxSvgIcon(
                                "packages/fx_flutterap_components/assets/svgs/arrowup2.svg",
                                size: InitialDims.icon2,
                                color: InitialStyle.successColorRegular,
                              ),
                              FxText(
                                widgetRateList[index],tag:Tag.h6,
                                color: InitialStyle.successColorRegular,
                                align: TextAlign.justify,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              FxSvgIcon(
                                "packages/fx_flutterap_components/assets/svgs/arrowdown2.svg",
                                size: InitialDims.icon2,
                                color: InitialStyle.dangerColorRegular,
                              ),
                              FxText(
                                widgetRateList[index],
                                tag:Tag.h6,
                                color: InitialStyle.dangerColorRegular,
                                align: TextAlign.justify,
                              ),
                            ],
                          )),
              ],
            )),
        index != (widgetNameList.length - 1) ? const FxHDivider() : Container()
      ],
    );
  }
}
