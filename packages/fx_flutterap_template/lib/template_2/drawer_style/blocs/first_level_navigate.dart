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
    double boxVerticalPadding(BuildContext context) =>
        (InitialDims.space3);

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
        margin: EdgeInsets.symmetric(
          vertical: InitialDims.space1,
          // horizontal: InitialDims.space2,
        ),
        decoration: isSelected ?? false
            ? selectedBoxDecoration()
            : BoxDecoration(
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
              padding: tilePadding ??
                  EdgeInsets.symmetric(
                    vertical: boxVerticalPadding(context),
                    horizontal: (InitialDims.space2),
                  ),
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
