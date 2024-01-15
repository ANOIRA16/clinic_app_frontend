import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/cupertino.dart';
import '../fx_text/fx_text.dart';
import 'package:intl/intl.dart' as intl;

class FxShapedBreadButton extends StatelessWidget {
  final String text;
  final bool isFirstButton;
  final double? depth;
  final double? padding;
  final Color? backgroundColor;
  final Color? textColor;

  const FxShapedBreadButton(
    this.text,
    this.isFirstButton, {
    Key? key,
    this.depth,
    this.padding,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double depth0 = depth ?? 10;
    double padding0 = padding ?? InitialDims.space2;

    bool isDirectionRTL(BuildContext context) {
      return intl.Bidi.isRtlLanguage(
          Localizations.localeOf(context).languageCode);
    }

    bool rtl = isDirectionRTL(context);

    return ClipPath(
      clipper: _TriangleClipper(!isFirstButton, rtl: rtl, depth: depth0),
      child: Container(
        color: backgroundColor ?? InitialStyle.buttonColor,
        child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: isFirstButton ? padding0 : depth0,
                end: depth0 + padding0,
                top: padding0,
                bottom: padding0),
            child: FxText(
              text,
              color: textColor ?? InitialStyle.onPrimaryColor,
            )),
      ),
    );
  }
}

class _TriangleClipper extends CustomClipper<Path> {
  final bool twoSideClip;
  final bool rtl;
  final double depth;

  _TriangleClipper(
      this.twoSideClip, {
        required this.rtl,
        required this.depth,
      });

  @override
  Path getClip(Size size) {
    final Path path = Path();

    if (rtl) {
      if (twoSideClip) {
        path.moveTo(size.width , 0.0);
        path.lineTo(size.width- depth, size.height / 2);
        path.lineTo(size.width, size.height);
      }
      else {
        path.moveTo(size.width, size.height);
      }
      path.lineTo(depth, size.height);
      path.lineTo(0, size.height / 2);

      path.lineTo(depth, 0);
      path.lineTo(size.width, 0);

      return path;
    } else {
      if (twoSideClip) {
        path.moveTo(0, 0.0);
        path.lineTo(depth, size.height / 2);
        path.lineTo(0, size.height);
      } else {
        path.lineTo(0, size.height);
      }
      path.lineTo(size.width- depth, size.height);
      path.lineTo(size.width , size.height / 2);
      path.lineTo(size.width- depth, 0);
      return path;
    }
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
