
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_builder.dart';


class FullScreenLayout extends StatelessWidget {

  final Widget child;

  const FullScreenLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StructureBuilder(

      child: child,
    );
  }

}
