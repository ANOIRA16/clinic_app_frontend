import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_accordion/fx_configurable_expansion_tile.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import '../../structure/structure_dims.dart';
import '../../structure/structure_styles.dart';

class NextLevelExpandedComplex extends StatelessWidget {
  final EdgeInsetsGeometry? childrenPadding;
  final bool? initialyExpanded;
  final String expansionTitle;
  final List<Widget> expansionWidgetList;

  const NextLevelExpandedComplex({
    Key? key,
    this.childrenPadding,
    this.initialyExpanded,
    required this.expansionTitle,
    required this.expansionWidgetList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry itemPadding(BuildContext context) =>
        EdgeInsets.symmetric(
          vertical: InitialDims.space1,
          horizontal: InitialDims.space1,
        );


    Widget nextLevelExpandedComplexTitle(
        {required String title, required int index}) {
      return InkWell(
        hoverColor: InitialStyle.hover,
        child: Container(
          decoration:  BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                      Radius.circular(InitialDims.border2))),
          child: Container(
            padding: itemPadding(context),
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  size: InitialDims.icon1,
                  color:InitialStyle.buttonTextColor,
                ),
                const FxHSpacer(
                  big: true,
                ),
                FxText(
                  title,
                  size: InitialDims.subtitleFontSize,
                  color:  InitialStyle.buttonTextColor,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return InkWell(
      hoverColor: InitialStyle.hover,
      child: FxConfigurableExpansionTile(
        initiallyExpanded: initialyExpanded,
        onExpansionChanged: (expanded){},
        tilePadding: const EdgeInsets.all(0),
        childrenPadding: childrenPadding ??
            EdgeInsets.symmetric(
                horizontal: 0, vertical: InitialDims.space2),
        margin:  EdgeInsets.symmetric(vertical: InitialDims.space2),
        iconColor: InitialStyle.buttonTextColor,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius:
                BorderRadius.all(Radius.circular(InitialDims.border2))),
        title: nextLevelExpandedComplexTitle(
          index: 0,
          title: expansionTitle,
        ),
        children: [
          ...List.generate(
              expansionWidgetList.length, (index) => expansionWidgetList[index])
        ],
      ),
    );
  }
}
