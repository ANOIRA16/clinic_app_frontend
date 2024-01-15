import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_config.dart';

import 'fx_text.dart';

class FxVariableHeightText extends StatelessWidget {
  final String data;
  final Tag? tag;
  final TextAlign align;
  final double? size;
  final double? height;
  final Color? color;
  final String? fontFamily;
  final bool overFlowTag;
  final int maxLine;
  final bool isBold;
  final bool isSelectable;

  const FxVariableHeightText(this.data,
      {Key? key,
      this.align = TextAlign.center,
      this.size,
      this.tag,
      this.color,
      this.fontFamily,
      this.overFlowTag = false,
      this.maxLine = 3,
      this.isBold = false,
      this.isSelectable = false,
      this.height})
      : super(key: key);

  const FxVariableHeightText.selectable(this.data,
      {Key? key,
      this.align = TextAlign.center,
      this.size,
      this.tag,
      this.color,
      this.fontFamily,
      this.overFlowTag = false,
      this.maxLine = 3,
      this.isBold = false,
      this.isSelectable = true,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget mainWidget = RichText(
      maxLines: overFlowTag ? maxLine : null,
      textAlign: align,
      text: TextSpan(
        text: data,
        style: TextStyle(
          height: height,
          textBaseline: TextBaseline.alphabetic,
          color: color ?? InitialStyle.textColor,
          fontSize: size ?? fontSize(tag??Tag.h4),
          fontFamily: fontFamily ?? InitialConfig.fontFamily,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          overflow: overFlowTag ? TextOverflow.ellipsis : null,
        ),
      ),
    );

    if (isSelectable) {
      return SelectionArea(
        child: mainWidget,
      );
    } else {
      return mainWidget;
    }
  }


  double fontSize(Tag tag){
    if(tag==Tag.h1){
      return InitialDims.bigTitleFontSize;
    }
    if(tag==Tag.h2){
      return InitialDims.highTitleFontSize;
    }
    if(tag==Tag.h3){
      return InitialDims.titleFontSize;
    }
    if(tag==Tag.h4 || tag==Tag.p){
      return InitialDims.normalFontSize;
    }
    if(tag==Tag.h5 || tag==Tag.span){
      return InitialDims.subtitleFontSize;
    }
    if(tag==Tag.h6){
      return InitialDims.smallFontSize;
    }
    else {
      return InitialDims.normalFontSize;
    }
  }
}
