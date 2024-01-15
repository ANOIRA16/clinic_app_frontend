import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:intl/intl.dart' as intl;

class FxMarkedText extends StatelessWidget {
  final String data;
  final TextAlign? align;
  final double? size;
  final Color? color;
  final bool isBold;
  final bool isSelectable;

  const FxMarkedText(
    this.data, {
    Key? key,
    this.align,
    this.size,
    this.color,
    this.isBold = false,
    this.isSelectable = false,
  }) : super(key: key);

  const FxMarkedText.selectable(
    this.data, {
    Key? key,
    this.align,
    this.size,
    this.color,
    this.isBold = false,
    this.isSelectable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDirectionRTL(BuildContext context) {
      return intl.Bidi.isRtlLanguage(
          Localizations.localeOf(context).languageCode);
    }

    bool rtl = isDirectionRTL(context);

    Widget mainWidget = IntrinsicWidth(
      child: RichText(
        textAlign: align ?? TextAlign.start,
        text: TextSpan(
          children: [
            rtl
                ? WidgetSpan(child: _emptyWidget())
                : WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      Icons.check_rounded,
                      size: size ?? InitialDims.subtitleFontSize,
                      color: color ?? InitialStyle.textColor,
                    ),
                  ),
            rtl
                ? WidgetSpan(child: _emptyWidget())
                : const WidgetSpan(
                    child: FxHSpacer(
                    big: true,
                  )),
            WidgetSpan(
                alignment: PlaceholderAlignment.bottom,
                child: FxText(
                  data,
                  size: size ?? InitialDims.subtitleFontSize,
                  color: color ?? InitialStyle.textColor,
                  isBold: isBold,
                )),
            rtl
                ? const WidgetSpan(
                    child: FxHSpacer(
                    big: true,
                  ))
                : WidgetSpan(child: _emptyWidget()),
            rtl
                ? WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      Icons.check_rounded,
                      size: size ?? InitialDims.subtitleFontSize,
                      color: color ?? InitialStyle.textColor,
                    ),
                  )
                : WidgetSpan(child: _emptyWidget()),
          ],
        ),
      ),
    );

    if (isSelectable) {
      return SelectionArea(
        child: mainWidget,
      );
    } else {
      return mainWidget;
    }
  }

  _emptyWidget() {
    return const SizedBox(
      width: 0,
      height: 0,
    );
  }
}
