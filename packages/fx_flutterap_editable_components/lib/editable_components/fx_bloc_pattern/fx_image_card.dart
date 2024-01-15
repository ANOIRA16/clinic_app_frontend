import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxImageCard extends StatelessWidget {
  final String imagePath;

  const FxImageCard({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: (InitialDims.space25) * 2,
      height: (InitialDims.space25) * 2,
      margin: EdgeInsets.symmetric(
        vertical: InitialDims.space2,
      ),
      decoration: BoxDecoration(
          color: InitialStyle.cardColor,
          borderRadius:
              BorderRadius.all(Radius.circular(InitialDims.border3))),
      child: Image.network(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
