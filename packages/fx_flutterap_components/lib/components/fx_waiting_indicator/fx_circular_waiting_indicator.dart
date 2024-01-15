import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxCircularWaitingIndicator extends StatelessWidget {
  final double? size;
  final Color? color;

  const FxCircularWaitingIndicator({
    Key? key,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width:size?? InitialDims.space5,
      height:size?? InitialDims.space5,
      child: CircularProgressIndicator(
        color:color?? InitialStyle.primaryColor,
      ),
    );
  }
}
