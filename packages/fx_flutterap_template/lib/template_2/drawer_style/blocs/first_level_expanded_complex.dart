import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_accordion/fx_configurable_expansion_tile.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import '../../structure/structure_dims.dart';
import '../../structure/structure_styles.dart';

class FirstLevelExpandedComplex extends StatelessWidget {
  final String iconPath;
  final EdgeInsetsGeometry? tilePadding;
  final bool? initialyExpanded;
  final String expansionTitle;
  final List<Widget> expansionWidgetList;

  const FirstLevelExpandedComplex({
    Key? key,
    required this.iconPath,
    this.tilePadding,
    this.initialyExpanded,
    required this.expansionTitle,
    required this.expansionWidgetList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double boxVerticalPadding(BuildContext context) =>
        (InitialDims.space3);


    Widget firstLevelExapandedTitle(
        {required String iconPath,
        required String title,
        required int index,
        EdgeInsetsGeometry? tilePadding,}) {
      return Container(
        decoration:BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(InitialDims.border2))),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(InitialDims.border2))),
                child: Image.asset(
                  "packages/fx_flutterap_components/assets/images/back.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: tilePadding ?? const EdgeInsets.all(0),
              child: Row(
                children: [
                  FxSvgIcon(
                    iconPath,
                    size: InitialDims.icon3,
                    color: InitialStyle.primaryLightColor,
                  ),
                  const FxHSpacer(
                    big: true,
                  ),
                  FxText(
                    title,
                    color: InitialStyle.primaryLightColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return InkWell(
      hoverColor: InitialStyle.hover,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: InitialDims.space1,
        ),
        child: FxConfigurableExpansionTile(
          initiallyExpanded: initialyExpanded,
          onExpansionChanged: (expanded){},
          margin: const EdgeInsets.all(0),
          tilePadding: tilePadding ??
              EdgeInsets.symmetric(
                  vertical: boxVerticalPadding(context),
                  horizontal: InitialDims.space2),
          backGroundImagePath: "packages/fx_flutterap_components/assets/images/back.png",
          iconColor: InitialStyle.primaryLightColor,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(InitialDims.border2))),
          title: firstLevelExapandedTitle(
            index: 0,
            iconPath: iconPath,
            title: expansionTitle,
          ),
          children: [
            ...List.generate(expansionWidgetList.length,
                (index) => expansionWidgetList[index])
          ],
        ),
      ),
    );
  }
}
