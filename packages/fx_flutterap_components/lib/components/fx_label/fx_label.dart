import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxLabel extends StatelessWidget {
  final Widget? widget;
  final Color? color;
  final bool? hasBorder;
  final Color? borderColor;
  final double? size;
  final double? labelPadding;
  final bool? isUnique;

  const FxLabel({
    Key? key,
    this.widget,
    this.color,
    this.borderColor,
    this.hasBorder,
    this.isUnique,
    this.size,
    this.labelPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double labelPadding0 = labelPadding ?? InitialDims.space0;
    return isUnique ?? true
        ? _label(context)
        : Stack(
      children: [
        Container(
            child: widget ?? const SizedBox()),
        Positioned(
            top: labelPadding0,
            left: labelPadding0,
            child: _label(context))
      ],
    );
  }

  Widget _label(BuildContext context) {
    double size0 = size ?? InitialDims.space2;
    return Container(
        decoration: BoxDecoration(
            color: color ?? InitialStyle.dangerColorRegular,
            border: hasBorder ?? false
                ? Border.all(
                    color: borderColor ?? InitialStyle.section,
                    width: size0 * 0.2)
                : null,
            borderRadius: BorderRadius.all(Radius.circular(
              size0,
            ))),
        child: Icon(Icons.circle,
            size: size0, color: color ?? InitialStyle.dangerColorRegular));
  }
}
