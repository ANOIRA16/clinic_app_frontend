import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:intl/intl.dart' as intl;

import '../fx_text/fx_text.dart';

// dependencies:
// smooth_page_indicator: ^1.0.0+2

class FxNumberPageIndicator extends StatelessWidget {
  /// PageView Controller
  final PageController controller;
  final int totalPage;
  final Color? normalColor;
  final Color? selectedColor;
  final Color? disabledColor;
  final Color? fillColor;
  final double? size;
  final double? margin;
  final Color? textColor;
  final bool hasButton;
  final JumperIndicatorType? jumperIndicatorType;

  const FxNumberPageIndicator.simple({
    Key? key,
    required this.controller,
    required this.totalPage,
    this.normalColor,
    this.selectedColor,
    this.disabledColor,
    this.textColor,
    this.fillColor,
    this.size,
    this.margin,
    this.hasButton = false,
    this.jumperIndicatorType = JumperIndicatorType.simple,
  }) : super(key: key);

  const FxNumberPageIndicator.limited({
    Key? key,
    required this.controller,
    required this.totalPage,
    this.normalColor,
    this.selectedColor,
    this.disabledColor,
    this.textColor,
    this.fillColor,
    this.size,
    this.margin,
    this.hasButton = true,
    this.jumperIndicatorType = JumperIndicatorType.limited,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDirectionRTL(BuildContext context) {
      return intl.Bidi.isRtlLanguage(
          Localizations.localeOf(context).languageCode);
    }

    bool rtl = isDirectionRTL(context);

    return Row(
      children: [
        hasButton ? _nextJumpIndicator(rtl, context) : Container(),
        jumperIndicatorType == JumperIndicatorType.simple
            ? _indicatorBuilderSimple(context)
            : Container(),
        jumperIndicatorType == JumperIndicatorType.limited
            ? _indicatorBuilderLimited(context)
            : Container(),
        hasButton ? _preJumpIndicator(rtl, context) : Container(),
      ],
    );
  }

  Widget _indicatorBuilderSimple(BuildContext context) {
    return Wrap(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(totalPage, (int index) {
        return _simpleBuildIndicator(index, context);
      }),
    );
  }

  Widget _indicatorBuilderLimited(BuildContext context) {
    int index =
        (controller.page != null ? controller.page!.round() % totalPage : 0);
    return Row(
      children: [
        index == totalPage - 1
            ? _simpleBuildIndicator(index - 2, context)
            : Container(),
        index == 0 ? Container() : _simpleBuildIndicator(index - 1, context),
        _simpleBuildIndicator(index, context),
        index == totalPage - 1
            ? Container()
            : _simpleBuildIndicator(index + 1, context),
        index == 0 ? _simpleBuildIndicator(index + 2, context) : Container(),
      ],
    );
  }

  Widget _nextJumpIndicator(bool rtl, BuildContext context) {
    double size0 = size ?? (InitialDims.space7);
    double margin0 = size0 * 0.2;
    Color normalColor0 = normalColor ?? InitialStyle.primaryDarkColor;
    Color fillColor0 = fillColor ?? InitialStyle.primaryLightColor;
    Color textColor0 = textColor ?? InitialStyle.primaryDarkColor;

    return InkWell(
      child: SizedBox(
        height: size0 + margin0,
        width: size0 + margin0,
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    color: fillColor0,
                    borderRadius: BorderRadius.all(Radius.circular(size0)),
                    border: Border.all(
                        color:
                            // index == 1 ? _disabledColor :
                            normalColor0,
                        width: 1)),
                width: size0,
                height: size0,
                child: Center(
                  child: FxSvgIcon(
                    rtl
                        ? "packages/fx_flutterap_components/assets/svgs/CaretRight.svg"
                        : "packages/fx_flutterap_components/assets/svgs/CaretLeft.svg",
                    color: textColor0,
                    size: size0 / 2,
                  ),
                )),
          ),
        ),
      ),
      onTap: () {
        controller.previousPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
    );
  }

  Widget _preJumpIndicator(bool rtl, BuildContext context) {
    double size0 = size ?? (InitialDims.space7);
    double margin0 = size0 * 0.2;
    Color normalColor0 = normalColor ?? InitialStyle.primaryDarkColor;
    Color textColor0 = textColor ?? InitialStyle.primaryDarkColor;
    Color fillColor0 = fillColor ?? InitialStyle.primaryLightColor;

    return InkWell(
      child: SizedBox(
        height: size0 + margin0,
        width: size0 + margin0,
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    color: fillColor0,
                    borderRadius: BorderRadius.all(Radius.circular(size0)),
                    border: Border.all(color: normalColor0, width: 1.2)),
                width: size0,
                height: size0,
                child: Center(
                  child: FxSvgIcon(
                    rtl
                        ? "packages/fx_flutterap_components/assets/svgs/CaretLeft.svg"
                        : "packages/fx_flutterap_components/assets/svgs/CaretRight.svg",
                    color:
                        // index == totalPage-1 ? _disabledColor :
                        textColor0,
                    size: size0 / 2,
                  ),
                )),
          ),
        ),
      ),
      onTap: () {
        // _disabledIndexes.contains(index+1) ? null:
        controller.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
    );
  }

  Widget _simpleBuildIndicator(int index, BuildContext context) {
    double size0 = size ?? (InitialDims.space7);
    double margin0 = size0 * 1.2;
    Color normalColor0 = normalColor ?? InitialStyle.primaryDarkColor;
    Color textColor0 = textColor ?? InitialStyle.primaryDarkColor;
    Color selectedColor0 = selectedColor ?? InitialStyle.specificColor;
    Color fillColor0 = fillColor ?? InitialStyle.primaryLightColor;
    bool isCurrentPageSelected = index ==
        (controller.page != null ? controller.page!.round() % totalPage : 0);

    return InkWell(
      child: SizedBox(
        height: margin0,
        width: margin0,
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    color: fillColor0,
                    borderRadius: BorderRadius.all(Radius.circular(size0)),
                    border: Border.all(
                        color: isCurrentPageSelected
                            ? selectedColor0
                            : normalColor0,
                        width: 1.2)),
                width: size0,
                height: size0,
                child: Center(
                  child: FxText(
                    "${index + 1}",
                    tag:Tag.h1,
                    color: textColor0,
                    size: size0 / 2,
                  ),
                )),
          ),
        ),
      ),
      onTap: () {
        controller.jumpToPage(index);
      },
    );
  }
}

enum JumperIndicatorType { simple, limited }
