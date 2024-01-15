
import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';

class FxVSpacer extends StatelessWidget {
  final bool big;
  final double factor;

  const FxVSpacer({Key? key, this.big = false, this.factor = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: big
          ? factor * InitialDims.space2
          : factor * InitialDims.space3,
    );
  }
}
