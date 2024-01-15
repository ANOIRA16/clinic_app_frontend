import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_kernel/structure/global_variables.dart';

import '../structure/structure_dims.dart';
import '../structure/structure_styles.dart';



class FxThemeButtonWidget extends StatelessWidget {


  const FxThemeButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxSvgIcon(
      nightMode
          ?
          "packages/fx_flutterap_components/assets/svgs/sun.svg"
          :
          "packages/fx_flutterap_components/assets/svgs/moon.svg",
      color: InitialStyle.primaryDarkColor,
      size: InitialDims.icon5,
    );
  }
}
