import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart' as intl;

class FxDottedText extends StatelessWidget {
  final String data;
  final TextAlign? align;
  final double? size;
  final Color? color;
  final Color? dotColor;
  final bool isBold;
  final bool? overFlowTag;
  final int? maxLine;
  final bool isSelectable;

  const FxDottedText(
    this.data, {
    Key? key,
    this.align,
    this.size,
    this.color,
    this.dotColor,
    this.overFlowTag,
    this.maxLine,
    this.isBold = false,
    this.isSelectable = false,
  }) : super(key: key);

  const FxDottedText.selectable(
    this.data, {
    Key? key,
    this.align,
    this.size,
    this.color,
    this.dotColor,
    this.overFlowTag,
    this.maxLine,
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
                      Icons.circle,
                      size: size ?? (InitialDims.smallFontSize) / 2,
                      color: dotColor ?? InitialStyle.textColor,
                    )),
            rtl
                ? WidgetSpan(child: _emptyWidget())
                : const WidgetSpan(
                    child: FxHSpacer(
                    big: true,
                  )),
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: FxText(
                  data,
                  align: align ?? TextAlign.start,
                  size: size ?? InitialDims.subtitleFontSize,
                  color: color ?? InitialStyle.textColor,
                  isBold: isBold,
                  overFlowTag: overFlowTag ?? false,
                  maxLine: maxLine ?? 2,
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
                      Icons.circle,
                      size: size ?? InitialDims.smallFontSize / 2,
                      color: dotColor ?? InitialStyle.textColor,
                    ))
                : WidgetSpan(child: _emptyWidget())
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

  Widget _emptyWidget() {
    return const SizedBox(
      width: 0,
      height: 0,
    );
  }
}
