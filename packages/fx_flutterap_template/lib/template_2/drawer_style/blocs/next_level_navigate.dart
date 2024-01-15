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
    EdgeInsetsGeometry itemPadding(BuildContext context) =>
        EdgeInsets.symmetric(
          vertical: InitialDims.space1,
          horizontal: InitialDims.space1,
        );

    BoxDecoration selectedBoxDecoration() {
      return BoxDecoration(
        color: InitialStyle.primaryDarkColor,
        borderRadius: BorderRadius.circular(InitialDims.border3),
        boxShadow: [
          BoxShadow(
            color: InitialStyle.primaryLightColor,
            offset: const Offset(0, 1.5),
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
                borderRadius: BorderRadius.all(
                    Radius.circular(InitialDims.border2))),
        child: Container(
          padding: itemPadding(context),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                size: InitialDims.icon1,
                color: isSelected ?? false
                    ? InitialStyle.primaryLightColor
                    : InitialStyle.secondaryDarkColor,
              ),
              const FxHSpacer(
                big: true,
              ),
              FxText(
                title,
                color: isSelected ?? false
                    ? InitialStyle.primaryLightColor
                    : InitialStyle.secondaryDarkColor,
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
