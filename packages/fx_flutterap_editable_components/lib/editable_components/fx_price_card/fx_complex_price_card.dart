import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_table/fx_simple_table.dart';


import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:fx_flutterap_kernel/structure/responsive_layout.dart';
class FxComplexPriceCard extends StatelessWidget {
  final List<String> titleList;
  final List<List<bool>> checkList;
  final List<String>? priceList;

  const FxComplexPriceCard({
    Key? key,
    required this.titleList,
    required this.checkList,
    this.priceList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> priceList0 = priceList ??
        List.generate(
          checkList.length,
          (index) => AppLocalizations.of(context)!.free,
        );
    return Container(
      alignment: Alignment.topCenter,
      child: FxSimpleTable(
        headingRowHeight: (InitialDims.space20),
        dataRowHeight: (InitialDims.space10) ,
        zebraMode: true,
        verticalModeBreakPoint: ResponsiveLayot.tabletLimit,
        zebraColor: InitialStyle.secondaryColor,
        headingColor: InitialStyle.buttonColor,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(InitialDims.border3)),
            color: InitialStyle.section),
        // columnSpacing: 100,
        rowsContent: [
          ...List.generate(
              titleList.length,
              (index) => [
                    FxText(titleList[index]),
                    checkList[0][index]
                        ? _centerTile(true, context)
                        : _centerTile(false, context),
                    checkList[1][index]
                        ? _centerTile(true, context)
                        : _centerTile(false, context),
                    checkList[2][index]
                        ? _centerTile(true, context)
                        : _centerTile(false, context),
                  ]),
        ],
        columnTitle: [
          const FxText(
            "",tag:Tag.h3,
          ),
          ...List.generate(
            checkList.length,
            (index) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FxText(_title(index, context),tag:Tag.h3,
                        color: InitialStyle.secondaryTextColor),
                    Row(
                      children: [
                        FxText(AppLocalizations.of(context)!.yearly,tag:Tag.h5,
                            color: InitialStyle.secondaryTextColor),

                        FxText(priceList0[index],
                            tag:Tag.h3,
                            color: InitialStyle.textInput),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _centerTile(bool tick, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const FxHSpacer(factor: 5,),
        Image.asset(
          tick
              ? "packages/fx_flutterap_components/assets/images/tick.png"
              : "packages/fx_flutterap_components/assets/images/cross.png",
          width: InitialDims.icon3,
          height: InitialDims.icon3,
        ),
      ],
    );
  }

  String _title(int index, BuildContext context) {
    if (index == 0) {
      return AppLocalizations.of(context)!.forstart;
    }
    if (index == 1) {
      return AppLocalizations.of(context)!.primary;
    }
    if (index == 2) {
      return AppLocalizations.of(context)!.golden;
    } else {
      return AppLocalizations.of(context)!.forstart;
    }
  }
}
