import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxHDivider extends StatelessWidget {
  final double top;
  final double bottom;
  final double? width;

  const FxHDivider({Key? key, this.top = 0,
    this.bottom = 0,
     this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: bottom),
      child: Container(
        height: 1,
        width: width,
        color: InitialStyle.divider,
      ),
    );
  }
}
