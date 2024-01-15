import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:intl/intl.dart' as intl;

import 'fx_text.dart';

class FxIconText extends StatelessWidget {
  final String data;
  final Widget? icon;
  final TextAlign? align;
  final double? size;
  final Color? color;
  final bool isBold;
  final bool? overFlowTag;
  final int? maxLine;
  final bool isSelectable;

  const FxIconText(
    this.data, {
    Key? key,
    this.icon,
    this.align,
    this.size,
    this.color,
    this.overFlowTag,
    this.maxLine,
    this.isBold = false,
    this.isSelectable = false,
  }) : super(key: key);

  const FxIconText.selectable(
    this.data, {
    Key? key,
    this.icon,
    this.align,
    this.size,
    this.color,
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
                    child: icon ?? _emptyWidget()),
            rtl
                ? WidgetSpan(child: _emptyWidget())
                : WidgetSpan(
                    child: icon == null
                        ? _emptyWidget()
                        : const FxHSpacer(
                            big: true,
                          )),
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: FxText(
                  data,
                  size: size ?? InitialDims.subtitleFontSize,
                  color: color ?? InitialStyle.textColor,
                  isBold: isBold,
                  align: align??TextAlign.start,
                )),
            rtl
                ? WidgetSpan(
                    child: icon == null
                        ? _emptyWidget()
                        : const FxHSpacer(
                            big: true,
                          ))
                : WidgetSpan(child: _emptyWidget()),
            rtl
                ? WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: icon ??
                        const SizedBox(
                          width: 0,
                          height: 0,
                        ))
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

  Widget _emptyWidget() {
    return const SizedBox(
      width: 0,
      height: 0,
    );
  }
}
