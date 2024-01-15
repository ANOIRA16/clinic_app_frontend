import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxTooltip extends StatelessWidget {
  final Widget widget;
  final String message;
  final Duration? waitDuration;
  final Duration? showDuration;
  final bool? preferBelow;
  final double? leftOffset;
  final double? rightOffset;
  final double? verticalOffset;
  final TextStyle? textStyle;
  final BoxDecoration? boxDecoration;
  final EdgeInsetsGeometry? padding;

  const FxTooltip({
    Key? key,
    required this.message,
    required this.widget,
    this.textStyle,
    this.waitDuration,
    this.showDuration,
    this.preferBelow,
    this.leftOffset,
    this.rightOffset,
    this.verticalOffset,
    this.boxDecoration,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
        message: message,
        waitDuration: waitDuration ?? const Duration(milliseconds: 0),
        showDuration: showDuration ?? const Duration(seconds: 0),
        padding: padding ?? EdgeInsets.all(InitialDims.space2),
        margin: EdgeInsets.only(
          left: leftOffset == null ? 0 : leftOffset ?? 200,
          right: rightOffset == null ? 0 : rightOffset ?? 200,
        ),
        verticalOffset: verticalOffset ?? InitialDims.space5,
        preferBelow: preferBelow ?? true,
        textStyle: textStyle ??
            TextStyle(
                fontSize: 12,
                color: InitialStyle.primaryLightColor,
                fontWeight: FontWeight.normal),
        decoration: boxDecoration ??
            BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: preferBelow ?? true
                        ? Radius.circular(InitialDims.border2)
                        : const Radius.circular(0),
                    bottomRight: preferBelow ?? true
                        ? const Radius.circular(0)
                        : Radius.circular(InitialDims.border2)),
                color: InitialStyle.buttonColor),
        child: widget);
  }
}
