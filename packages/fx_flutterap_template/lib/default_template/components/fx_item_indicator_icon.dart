import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';

import '../structure/structure_dims.dart';
import '../structure/structure_styles.dart';

class FxItemIndicatorIcon extends StatelessWidget {
  final String iconPath;

  const FxItemIndicatorIcon({Key? key, required this.iconPath,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(InitialDims.space3),
      decoration: BoxDecoration(
          color: InitialStyle.primaryLightColor,
          borderRadius:
          BorderRadius.all(Radius.circular(InitialDims.border3))),
      child: FxSvgIcon(
        iconPath ,
        size: InitialDims.icon4,
        color: InitialStyle.icon,
      ),
    );
  }
}


