import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import '../fx_text/fx_text.dart';

class FxContentLabel extends StatelessWidget {
  final Widget? widget;
  final String? text;
  final Color? textColor;
  final Widget? labelContent;
  final Color? color;
  final bool? hasBorder;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final double size;
  final double? widgetSize;
  final bool? isUnique;

  const FxContentLabel({
    Key? key,
    this.widget,
    this.text,
    this.textColor,
    this.labelContent,
    this.color,
    this.borderColor,
    this.hasBorder,
    this.isUnique,
    this.borderRadius,
    required this.size,
    this.widgetSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double widgetSize0 = widgetSize ?? size;

    return isUnique ?? true
        ? _lable(context)
        : Stack(
            children: [
              Container(
                  padding: EdgeInsets.all(size * 0.75),
                  child: widget ?? Container()),
              Positioned(
                  top: widgetSize == null ? null : widgetSize0,
                  left: widgetSize == null ? null : widgetSize0,
                  child: _lable(context))
            ],
          );
  }

  Widget _lable(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: borderColor ?? InitialStyle.section,
          border: hasBorder ?? false
              ? Border.all(
                  color: borderColor ?? InitialStyle.section,
                  width: size * 0.1)
              : null,
          borderRadius:
              borderRadius ?? BorderRadius.all(Radius.circular(InitialDims.defaultBorder))),
      child: Container(
        padding: EdgeInsets.all(size * 0.2),

        decoration: BoxDecoration(
            color: color ?? InitialStyle.dangerColorRegular,
            borderRadius:
                borderRadius ?? BorderRadius.all(Radius.circular(InitialDims.defaultBorder))),
        child: labelContent ??
            FxText(
              text ?? "",tag:Tag.h5,
              align: TextAlign.center,
              color: textColor ?? InitialStyle.primaryLightColor,
            ),
      ),
    );
  }
}
