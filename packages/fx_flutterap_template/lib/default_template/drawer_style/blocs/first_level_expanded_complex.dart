import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_accordion/fx_configurable_expansion_tile.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import '../../structure/structure_dims.dart';
import '../../structure/structure_styles.dart';

class FirstLevelExpandedComplex extends StatefulWidget {
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
  State<FirstLevelExpandedComplex> createState() => _FirstLevelExpandedComplexState();
}

class _FirstLevelExpandedComplexState extends State<FirstLevelExpandedComplex> {
  bool isExpanded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isExpanded = widget.initialyExpanded ?? false;
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    Widget firstLevelExapandedTitle(
        {required String iconPath,
        required String title,
        required int index,
        EdgeInsetsGeometry? tilePadding,}) {
      return Container(
        decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(InitialDims.border2))),
        child:Row(
          children: [
            FxSvgIcon(
              iconPath,
              size: InitialDims.icon3,
              color: InitialStyle.buttonTextColor,
            ),
            const FxHSpacer(
              big: true,
            ),
            FxText(
              title,
              size: InitialDims.normalFontSize,
              color: InitialStyle.buttonTextColor,
            ),
          ],
        ),
      );
    }

    return InkWell(
      hoverColor: InitialStyle.hover,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: InitialDims.space2,
          horizontal: InitialDims.space1,
        ),
        child: FxConfigurableExpansionTile(
          initiallyExpanded: widget.initialyExpanded,
          onExpansionChanged: (state){
            setState(() {
              isExpanded=state;
            });
          },
          margin: const EdgeInsets.all(0),
          childrenPadding: EdgeInsets.symmetric(
            horizontal: InitialDims.space4,
            vertical: InitialDims.space1,
          ),
          tilePadding: widget.tilePadding ??
              EdgeInsets.symmetric(
                  vertical: InitialDims.space4,
              horizontal: InitialDims.space2 ),
          iconColor: InitialStyle.buttonTextColor,
          decoration: BoxDecoration(
            color: isExpanded
                ? InitialStyle.secondaryColor
                : InitialStyle.secondaryDarkColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(InitialDims.border3))),
          title: firstLevelExapandedTitle(
            index: 0,
            iconPath: widget.iconPath,
            title: widget.expansionTitle,
          ),
          children: [
            ...List.generate(widget.expansionWidgetList.length,
                (index) => widget.expansionWidgetList[index])
          ],
        ),
      ),
    );
  }
}
