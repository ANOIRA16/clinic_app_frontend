import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import '../../structure/structure_dims.dart';
import '../../structure/structure_styles.dart';

class NextLevelNavigate extends StatelessWidget {
  final String title;
  final int index;
  final void Function() onSelect;
  final String? routeName;
  final bool? isSelected;

  const NextLevelNavigate(
      {Key? key,
      required this.title,
      required this.index,
      required this.onSelect,
      this.routeName,
      this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration selectedBoxDecoration() {
      return BoxDecoration(
        color: isSelected ?? false
            ? InitialStyle.buttonColor
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
        decoration: isSelected ?? false
            ? selectedBoxDecoration()
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius:
                    BorderRadius.all(Radius.circular(InitialDims.border2))),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: InitialDims.space3,
            horizontal: InitialDims.space1,
          ),
          child: Row(
            children: [
              Icon(
                Icons.circle_outlined,
                size: InitialDims.icon1,
                color: InitialStyle.buttonTextColor,
              ),
              const FxHSpacer(
                big: true,
              ),
              FxText(
                title,
                size: InitialDims.subtitleFontSize,
                isBold: isSelected ?? false,
                color: InitialStyle.buttonTextColor,
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
