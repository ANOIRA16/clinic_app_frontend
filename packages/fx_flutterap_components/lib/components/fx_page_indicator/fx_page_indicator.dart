import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:intl/intl.dart' as intl;

class FxPageIndicator extends StatelessWidget {
  final PageController controller;
  final int totalPage;
  final Color? normalColor;
  final Color? selectedColor;
  final double? size;
  final double? margin;
  final Color? textColor;
  final bool hasButton;

  const FxPageIndicator({
    Key? key,
    required this.controller,
    required this.totalPage,
    this.normalColor,
    this.selectedColor,
    this.size,
    this.margin,
    this.hasButton = false,
    this.textColor,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List<Widget>.generate(totalPage, (int index) {
            return _simpleBuildIndicator(index, context);
          }),
        ),
        hasButton ? _preJumpIndicator(rtl, context) : Container(),
      ],
    );
  }

  Widget _nextJumpIndicator(bool rtl, BuildContext context) {
    double size0 = size ?? InitialDims.space2;

    Color normalColor0 = normalColor ?? InitialStyle.icon;

    return InkWell(
      child: FxSvgIcon(
        rtl
            ? "packages/fx_flutterap_components/assets/svgs/CaretRight.svg"
            : "packages/fx_flutterap_components/assets/svgs/CaretLeft.svg",
        color: normalColor0,
        size: size0 * 3,
      ),
      onTap: () {
        controller.previousPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
    );
  }

  Widget _preJumpIndicator(bool rtl, BuildContext context) {
    double size0 = size ?? InitialDims.space2;
    Color normalColor0 = normalColor ?? InitialStyle.icon;

    return InkWell(
      child: FxSvgIcon(
        rtl
            ? "packages/fx_flutterap_components/assets/svgs/CaretLeft.svg"
            : "packages/fx_flutterap_components/assets/svgs/CaretRight.svg",
        color: normalColor0,
        size: size0 * 3,
      ),
      onTap: () {
        // _disabledIndexes.contains(index+1) ? null:
        controller.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
    );
  }

  Widget _simpleBuildIndicator(int index, BuildContext context) {
    double size0 = size ?? InitialDims.space2;
    double margin0 = size0 * 0.5;
    Color normalColor0 = normalColor ?? InitialStyle.buttonColor;
    Color selectedColor0 = selectedColor ?? InitialStyle.specificColor;

    bool isCurrentPageSelected = index ==
        (controller.page != null ? controller.page!.round() % totalPage : 0);

    return InkWell(
      child: SizedBox(
        height: size0,
        width: size0 + margin0,
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: isCurrentPageSelected ? selectedColor0 : normalColor0,
                borderRadius: BorderRadius.all(Radius.circular(size0)),
              ),
              width: isCurrentPageSelected ? size0 * 2.5 : size0,
              height: size0,
            ),
          ),
        ),
      ),
      onTap: () {
        controller.jumpToPage(index);
      },
    );
  }
}
