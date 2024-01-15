import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxAvatarImage extends StatelessWidget {
  final String path;
  final bool? fromNetworkPath;
  final double? borderRadius;
  final double? size;
  final Color? backgroungColor;
  final bool? isrectangle;

  const FxAvatarImage(
      {Key? key,
      required this.path,
      this.fromNetworkPath,
      this.borderRadius,
      this.size,
      this.backgroungColor,
      this.isrectangle})
      : super(key: key);

  const FxAvatarImage.rectangle({
    Key? key,
    required this.path,
    this.fromNetworkPath,
    this.size,
    this.backgroungColor,
    this.isrectangle = true,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius0 = borderRadius ?? (InitialDims.icon4);
    double size0 = size ?? (InitialDims.icon4);

    return isrectangle ?? false
        ? Container(
            clipBehavior: Clip.antiAlias,
            width: size0 * 2,
            height: size0 * 2,
            decoration: BoxDecoration(
                color: backgroungColor ?? InitialStyle.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(radius0))),
            child: SizedBox(
                height: size0 * 2,
                width: size0 * 2,
                child: Image.asset(
                  path,
                  fit: BoxFit.cover,
                )))
        : CircleAvatar(
            backgroundColor: backgroungColor ?? InitialStyle.primaryColor,
            radius: size0,
            child: SizedBox(
                height: size0 * 2,
                width: size0 * 2,
                child: ClipOval(
                  child:(fromNetworkPath??false)? Image.network(
                    path,
                    fit: BoxFit.cover,
                  ):Image.asset(
                    path,
                    fit: BoxFit.cover,
                  ),
                )));
  }
}
