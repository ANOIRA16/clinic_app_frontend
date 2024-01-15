import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxHorizontalDashDivider extends StatelessWidget {
  final double? thickness;
  final double? dashWidth;
  final Color? color;
  const FxHorizontalDashDivider({Key? key,
    this.thickness,
    this.dashWidth,
    this.color})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        double dashWidth0 = dashWidth??2.0;
        final dashHeight = thickness??1;
        final dashCount = (boxWidth / (2 * dashWidth0)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth0,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color??InitialStyle.divider),
              ),
            );
          }),
        );
      },
    );
  }
}