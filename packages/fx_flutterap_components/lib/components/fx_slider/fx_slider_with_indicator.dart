import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';


import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FxSliderWithIndicator extends StatefulWidget {
  final List<Widget> items;
  final CarouselController controller;

  const FxSliderWithIndicator(
      {Key? key, required this.items, required this.controller})
      : super(key: key);

  @override
  State<FxSliderWithIndicator> createState() => _FxSliderWithIndicatorState();
}

class _FxSliderWithIndicatorState extends State<FxSliderWithIndicator> {
  int _current = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CarouselSlider(
            carouselController: widget.controller,
            items: widget.items,
            options: CarouselOptions(
                viewportFraction: 0.8,
                initialPage: 2,
                disableCenter: true,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds:50),
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
        const FxVSpacer(),
        Align(
          alignment: const Alignment(0, 0.6),
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
                        color:_current == entry.key
                            ? InitialStyle.specificColor
                            : InitialStyle.primaryLightColor
                    )),
              );
            }).toList(),
          ),
        )
      ],
    );
  }


}
