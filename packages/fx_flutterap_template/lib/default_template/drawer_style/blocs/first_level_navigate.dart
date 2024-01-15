import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import '../../structure/structure_dims.dart';
import '../../structure/structure_styles.dart';

class FirstLevelNavigate extends StatelessWidget {
  final String iconPath;
  final String title;
  final int index;
  final void Function() onSelect;
  final EdgeInsetsGeometry? tilePadding;
  final String? routeName;
  final bool? isSelected;

  const FirstLevelNavigate(
      {Key? key,
      required this.iconPath,
      required this.title,
      required this.index,
      required this.onSelect,
      this.tilePadding,
      this.routeName,
      this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    BoxDecoration selectedBoxDecoration() {
      return BoxDecoration(
        color:isSelected??false
            ?InitialStyle.buttonColor
            : InitialStyle.secondaryDarkColor,
        borderRadius: BorderRadius.circular(InitialDims.border3),
        boxShadow: [
          BoxShadow(
            color: InitialStyle.buttonColor,
            blurRadius: InitialDims.space1,

          ),
        ],
      );
    }

    return InkWell(
      hoverColor: InitialStyle.hover,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: InitialDims.space1,
          // horizontal: InitialDims.space2,
        ),
        padding: EdgeInsets.symmetric(
          vertical: InitialDims.space1,
          // horizontal: InitialDims.space2,
        ),
        decoration: isSelected ?? false
            ? selectedBoxDecoration()
            : BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(InitialDims.border2))),
        child:Container(
          padding: tilePadding ??
              EdgeInsets.symmetric(
                vertical: (InitialDims.space3),
                horizontal: (InitialDims.space2),
              ),
          child: Row(
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
                isBold: isSelected??false,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        onSelect();
        routeName == null
            ? null
            : Navigator.pushReplacementNamed(context, routeName!);
      },
    );
  }
}
