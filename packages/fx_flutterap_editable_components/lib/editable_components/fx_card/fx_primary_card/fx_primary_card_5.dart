import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_group_list/fx_group_list.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';

class FxPrimaryCard5 extends StatelessWidget {
  final List<String>? stringList;

  const FxPrimaryCard5({
    Key? key,
    this.stringList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> stringList0 = stringList ??
        List.generate(
          10,
          (index) =>
              AppLocalizations.of(context)!.item + (index + 1).toString(),
        );

    List<Widget> widgetList = List.generate(4, (index) {
      return FxText(
        stringList0[index],
        align: TextAlign.start,
        overFlowTag: true,
        maxLine: 1,
      );
    });

    return FxCard(
        body: FxGroupList(
      widgetList: widgetList,
    ));
  }
}
