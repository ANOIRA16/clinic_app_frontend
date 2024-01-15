import 'package:flutter/cupertino.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';

class FxSimpleBreadButton extends StatelessWidget {
  final String text;
  final Widget? suffix;
  final bool isFirstButton;
  final Color? color;

  const FxSimpleBreadButton(
      this.text, this.suffix, this.isFirstButton,
      {Key? key, this.color,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FxText(
          text,
          size: InitialDims.subtitleFontSize,
          color: color,
        ),
        suffix ??
            FxText(
              " / ",
              color: color,
              size: InitialDims.subtitleFontSize,
            )
      ],
    );
  }
}
