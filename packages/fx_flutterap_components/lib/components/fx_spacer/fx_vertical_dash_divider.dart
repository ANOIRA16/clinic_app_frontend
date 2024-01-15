import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxVerticalDashDivider extends StatelessWidget {
  final double? thickness;
  final double? dashWidth;
  final Color? color;
  const FxVerticalDashDivider({Key? key,
    this.thickness,
    this.dashWidth,
    this.color})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxHeight = constraints.constrainHeight();
        double dashHeight =dashWidth?? 2.0;
        final dashwidth = thickness??1;
        final dashCount = (boxHeight / (2 * dashHeight)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashwidth,
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