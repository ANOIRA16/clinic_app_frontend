import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_table/fx_simple_table.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxProfileIncome extends StatelessWidget {
  final List<List<String>>? contentList;

  const FxProfileIncome({
    Key? key,
    this.contentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<String>> contentList0 = contentList ??
        [
          ...List.generate(10, (index) {
            return [
              ...List.generate(3, (index2) {
                if (index2 == 0) {
                  return "07.11.2021";
                }
                if (index2 == 1) {
                  return (Random().nextInt(50)).toString();
                }
                if (index2 == 2) {
                  return "${AppLocalizations.of(context)!.currencyunit}127000";
                }
                return AppLocalizations.of(context)!.loremshort;
              })
            ];
          }),
        ];

    return SingleChildScrollView(
      child: FxSimpleTable(
        headingRowHeight: (InitialDims.space20),
        dataRowHeight: (InitialDims.space10) ,
        zebraMode: true,
        zebraColor: InitialStyle.secondaryColor,
        headingColor: InitialStyle.buttonColor,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(InitialDims.border3)),
            color: InitialStyle.section),
        rowsContent: [
          ...List.generate(contentList0.length, (index) {
            return [
              ...List.generate(
                  contentList0[index].length,
                  (index2) => FxText(contentList0[index][index2],tag:Tag.h3,
                      color: InitialStyle.textColor))
            ];
          }),
        ],
        columnTitle: [
          FxText(AppLocalizations.of(context)!.date,tag:Tag.h3,
              color: InitialStyle.primaryLightColor),
          FxText(AppLocalizations.of(context)!.numberofsales,tag:Tag.h3,
              color: InitialStyle.primaryLightColor),
          FxText(AppLocalizations.of(context)!.income,tag:Tag.h3,
              color: InitialStyle.primaryLightColor),
        ],
      ),
    );
  }
}
