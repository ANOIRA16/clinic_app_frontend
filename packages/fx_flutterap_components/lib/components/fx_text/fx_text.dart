import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_config.dart';

class FxText extends StatelessWidget {
  final String data;
  final TextAlign? align;
  final TextDecoration? decoration;
  final Color? backgroundColor;
  final double? size;
  final double? height;
  final Color? color;
  final Tag? tag;
  final bool isSelectable;

  final String? fontFamily;
  final bool overFlowTag;
  final int maxLine;
  final bool isBold;

  const FxText(this.data,
      {Key? key,
      this.align ,
      this.decoration,
      this.backgroundColor,
      this.size,
      this.color,
      this.tag,
      this.fontFamily,
      this.overFlowTag = false,
      this.maxLine = 3,
      this.isBold = false,
      this.isSelectable = false,
      this.height})
      : super(key: key);

  const FxText.selectable(this.data,
      {Key? key,
      this.align,
      this.decoration,
      this.backgroundColor,
      this.size,
      this.color,
      this.tag,
      this.fontFamily,
      this.overFlowTag = false,
      this.maxLine = 3,
      this.isBold = false,
      this.isSelectable = true,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget mainWidget = Text(
      data,
      textAlign: align??TextAlign.start,
      maxLines: overFlowTag ? maxLine : null,
      style: TextStyle(
        backgroundColor: backgroundColor ?? Colors.transparent,
        decoration: decoration ?? TextDecoration.none,
        height: height,
        textBaseline: TextBaseline.alphabetic,
        color: color ?? InitialStyle.textColor,
        fontSize: size ?? fontSize(tag??Tag.h4),
        fontFamily: fontFamily ?? InitialConfig.fontFamily,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        overflow: overFlowTag ? TextOverflow.ellipsis : null,
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


enum Tag{
  h1,h2,h3,h4,h5,h6,p,span

}