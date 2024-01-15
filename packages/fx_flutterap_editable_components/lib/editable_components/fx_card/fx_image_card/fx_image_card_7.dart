import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';

class FxImageCard7 extends StatelessWidget {
  final String? imagePath;

  const FxImageCard7({
    Key? key,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxCard(
      padding: EdgeInsets.all(InitialDims.space0),
      bodyPadding: EdgeInsets.all(InitialDims.space0),
      body: Image.asset(
        imagePath ?? "packages/fx_flutterap_components/assets/images/img2.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
