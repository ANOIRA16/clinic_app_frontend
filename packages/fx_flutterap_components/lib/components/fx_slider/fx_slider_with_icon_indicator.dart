import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:intl/intl.dart' as intl;

class FxSliderWithIconIndicator extends StatefulWidget {
  final List<Widget> items;
  final CarouselController controller;
  final Widget? nextIcon;
  final Widget? previousIcon;
  final Alignment? alignment;

  const FxSliderWithIconIndicator({
    Key? key,
    required this.items,
    required this.controller,
    this.nextIcon,
    this.previousIcon,
    this.alignment,
  }) : super(key: key);

  @override
  State<FxSliderWithIconIndicator> createState() =>
      _FxSliderWithIconIndicatorState();
}

class _FxSliderWithIconIndicatorState extends State<FxSliderWithIconIndicator> {
  int _current = 0;

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
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index+1;

                    if(index==widget.items.length-1){
                      _current=0;
                    }
                  });
                }),
          ),
        ),
        Align(
          alignment: const Alignment(0, 0.6),
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
                      size: InitialDims.space5,
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
                      size: InitialDims.space5,
                    ),
                onTap: () {
                  widget.controller.nextPage();
                },
              ),
            ],
          ),
        ),
        Align(
          alignment: widget.alignment ?? const Alignment(0, 0.6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.items.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => widget.controller.animateToPage(entry.key),
                child: Container(
                    width: InitialDims.space2,
                    height: InitialDims.space2,
                    margin:
                        EdgeInsets.symmetric(horizontal: InitialDims.space1),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == entry.key
                            ? InitialStyle.specificColor
                            : InitialStyle.primaryLightColor)),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
