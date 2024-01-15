import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import '../../fx_card/fx_image_card/fx_image_card_7.dart';

class FxProfileImagesCard extends StatelessWidget {
  final List<String> imagePathList;

  const FxProfileImagesCard({
    Key? key,
    required this.imagePathList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(
      gutterSize: 10,
    );
    return SingleChildScrollView(
      child: BootstrapContainer(
          fluid: true,
          padding: const EdgeInsets.all(0),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          children: List.generate(imagePathList.length, (index) {
            return _boxShow(FxImageCard7(
              imagePath: imagePathList[index],
            ));
          })),
    );
  }

  Widget _boxShow(Widget widget) {
    return BootstrapCol(
        sizes: 'col-sm-6 col-ml-4 col-lg-3 col-xl-2', child: widget);
  }
}
