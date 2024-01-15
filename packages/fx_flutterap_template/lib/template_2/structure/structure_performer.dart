
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'structure_config.dart';
import 'structure_dims.dart';
import 'structure_styles.dart';

 class StructurePerformer extends InheritedWidget{

  final Widget body;
  final StructureDims dims;
  final StructureStyles styles;
  final StructureConfig configs;


   StructurePerformer({Key? key,
    required this.body,
    required this.dims,
    required this.styles,
    required this.configs,
  }) : super(key: key, child: body){
    dims;
    styles;
    configs;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }


}
