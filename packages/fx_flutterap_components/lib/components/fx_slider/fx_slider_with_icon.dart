import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart' as intl;

class FxSliderWithIcon extends StatefulWidget {
  final List<Widget> items;
  final CarouselController controller;
  final Widget? nextIcon;
  final Widget? previousIcon;
  final Alignment? alignment;

  const FxSliderWithIcon({
    Key? key,
    required this.items,
    required this.controller,
    this.nextIcon,
    this.previousIcon,
    this.alignment,
  }) : super(key: key);

  @override
  State<FxSliderWithIcon> createState() => _FxSliderWithIconState();
}

class _FxSliderWithIconState extends State<FxSliderWithIcon> {
  @override
  Widget build(BuildContext context) {

    bool isDirectionRTL(BuildContext context) {
      return intl.Bidi.isRtlLanguage(
          Localizations.localeOf(context).languageCode);
    }
    bool rtl = isDirectionRTL(context);

    return Stack(
      children: [
        Center(
          child: CarouselSlider(
            carouselController: widget.controller,
            items: widget.items,
            options: CarouselOptions(
                viewportFraction: 0.8,
                // height: 270,
                initialPage: 2,
                disableCenter: true,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 100),
                // aspectRatio: 0.1,
                enlargeCenterPage: true),
          ),
        ),
        Align(
          alignment: widget.alignment ?? const Alignment(0, 0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: widget.previousIcon ??
                    FxSvgIcon(
                      rtl
                          ? "packages/fx_flutterap_components/assets/svgs/CaretRight.svg"
                          : "packages/fx_flutterap_components/assets/svgs/CaretLeft.svg",
                      color: InitialStyle.primaryLightColor,
                      size: (InitialDims.space10) ,
                    ),
                onTap: () {
                  widget.controller.previousPage();
                },
              ),
              InkWell(
                child: widget.nextIcon ??
                    FxSvgIcon(
                      rtl
                          ? "packages/fx_flutterap_components/assets/svgs/CaretLeft.svg"
                          : "packages/fx_flutterap_components/assets/svgs/CaretRight.svg",
                      color: InitialStyle.primaryLightColor,
                      size: (InitialDims.space10) ,
                    ),
                onTap: () {
                  widget.controller.nextPage();
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
