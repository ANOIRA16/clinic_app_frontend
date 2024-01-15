import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';

class FxChartIndicator extends StatelessWidget {
  final List<String> titleList;
  final List<Color> colorList;

  const FxChartIndicator(
      {Key? key, required this.titleList, required this.colorList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: InitialDims.space2,
        runSpacing: InitialDims.space2,
        children: [
          ...List.generate(titleList.length,
              (index) => _indicator(titleList[index], colorList[index])),
        ]);
  }

  Widget _indicator(String title, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle,
          color: color,
          size: InitialDims.icon1,
        ),
        const FxHSpacer(
          factor: 0.5,
        ),
        FxText(
          title,
          size: InitialDims.smallFontSize,
        ),
      ],
    );
  }
}
