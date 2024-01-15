import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxAvatarWidget extends StatelessWidget {
  final Widget widget;
  final Color? backGroundColor;
  final double? radius;
  final double? size;
  final bool? isrectangle;

  const FxAvatarWidget({
    Key? key,
    required this.widget,
    this.radius,
    this.backGroundColor,
    this.size,
    this.isrectangle,
  }) : super(key: key);

  const FxAvatarWidget.rectangle(
      {Key? key,
      required this.widget,
      this.size,
      this.isrectangle=true,
      this.backGroundColor,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius0 = radius ?? (InitialDims.icon2);
    double size0 = size ?? (InitialDims.icon4);

    return isrectangle ?? false
        ? Container(
            clipBehavior: Clip.antiAlias,
            width: size0*2,
            height: size0*2,
            decoration: BoxDecoration(
                color: InitialStyle.buttonColor,
                borderRadius: BorderRadius.all(Radius.circular(radius0))),
            child: SizedBox(
                height: size0*2,
                width: size0*2,
                child: SizedBox(
                    height: size0*2, width: size0*2, child: Center(child: widget))))
        : CircleAvatar(
            backgroundColor: backGroundColor ?? InitialStyle.buttonColor,
            radius: size0,
            child: SizedBox(
                height: size0*2,
                width: size0*2,
                child: Center(child: widget)));
  }
}
