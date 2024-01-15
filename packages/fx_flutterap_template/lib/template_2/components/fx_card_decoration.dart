import 'package:flutter/material.dart';

import '../structure/structure_dims.dart';
import '../structure/structure_styles.dart';

class FxCardDecoration  {

 BoxDecoration decoration=BoxDecoration(
  color: InitialStyle.section,
  borderRadius:
  BorderRadius.all(Radius.circular((InitialDims.border3))),

 );

 EdgeInsetsGeometry cardShowMargin= EdgeInsets.symmetric(
  vertical: InitialDims.space2,
  horizontal: InitialDims.space2,
);


}


