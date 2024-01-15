// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';


import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import 'fx_classic_search_card.dart';

class FxSearchResult extends StatefulWidget {
  final List<Widget>? cardWidgetList;
  final int num;
  final String searchWord;

  const FxSearchResult({
    Key? key,
    this.cardWidgetList,
    required this.num,
    required this.searchWord,
  }) : super(key: key);

  @override
  State<FxSearchResult> createState() => _FxSearchResultState();
}

class _FxSearchResultState extends State<FxSearchResult> {
  @override
  Widget build(BuildContext context) {
    List<Widget> cardwidgetList = widget.cardWidgetList ??
        List.generate(widget.num, (index) => FxClassicSearchCard());

    return Column(children: [
      const FxVSpacer(
        factor: 5,
      ),
      Expanded(
        flex: 1,
        child: Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FxText(
              widget.num.toString(),tag:Tag.h2,
            ),
            const FxHSpacer(),
            FxText(
              AppLocalizations.of(context)!.resultsfindfor,
              tag:Tag.h2,
              color: InitialStyle.titleTextColor,
            ),
            FxText(
              "\" ${widget.searchWord} \"",tag:Tag.h2,
              color: InitialStyle.informationColorRegular,
            ),
          ],
        ),
      ),
      const FxVSpacer(
        big: true,
        factor: 3,
      ),
      Expanded(
          flex: 10,
          child: SingleChildScrollView(
            child: Wrap(
                spacing: InitialDims.space5,
                runSpacing: InitialDims.space2,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  widget.num,
                  (index) {
                    return cardwidgetList[index];
                  },
                )),
          )),
    ]);
  }
}
