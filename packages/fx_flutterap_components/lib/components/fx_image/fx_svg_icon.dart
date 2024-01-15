import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxSvgIcon extends StatelessWidget {
  final String? path;
  final double? size;
  final Color? color;

  const FxSvgIcon(this.path, {this.size, this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path!,
      colorFilter:
          ColorFilter.mode(color ?? InitialStyle.icon, BlendMode.srcIn),
      width: (size ?? InitialDims.icon10),
      height: (size ?? InitialDims.icon10),
    );
  }
}
