import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FxRatingBar extends StatefulWidget {
  final double? initialRate;
  final double? minRating;
  final Widget? icon;

  const FxRatingBar({Key? key, this.initialRate, this.minRating, this.icon})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxRatingBarState();
  }
}

class _FxRatingBarState extends State<FxRatingBar> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: widget.initialRate ?? 3,
      minRating: widget.minRating ?? 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding:  EdgeInsets.symmetric(horizontal: InitialDims.space1),
      itemBuilder: (context, _) =>
          widget.icon ??
          FxSvgIcon(
            "packages/fx_flutterap_components/assets/svgs/star.svg",
            color: InitialStyle.specificColor,
          ),itemSize: InitialDims.icon4,
      onRatingUpdate: (rating) {},
    );
  }
}
