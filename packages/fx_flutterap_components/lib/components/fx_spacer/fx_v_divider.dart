import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxVDivider extends StatelessWidget {
  final double right;
  final double left;
  final double? width;

  const FxVDivider({Key? key, this.right = 0,
    this.left = 0,
     this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(right: right, left: left),
      child: Container(
        height: width,
        width: 1,
        color: InitialStyle.divider,
      ),
    );
  }
}
