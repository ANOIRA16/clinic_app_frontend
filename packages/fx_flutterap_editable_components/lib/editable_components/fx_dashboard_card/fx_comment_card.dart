import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_form/fx_rating_bar.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxCommentCard extends StatelessWidget {
  final List<Widget>? avatarList;
  final List<String>? contentList;
  final List<double>? rateList;

  FxCommentCard({
    Key? key,
    this.avatarList,
    this.contentList,
    this.rateList,
  }) : super(key: key);

  final CarouselController _carouselController1 = CarouselController();

  @override
  Widget build(BuildContext context) {
    // int num=contentList!.length;
    List<Widget> avatarList0 = avatarList ??
        List.generate(
          4,
          (index) => FxAvatarImage(
            path:
                "packages/fx_flutterap_components/assets/images/avatar${index + 1}.png",
            size: InitialDims.icon8,
          ),
        );
    List<String> contentList0 = contentList ??
        List.generate(
          4,
          (index) => AppLocalizations.of(context)!.lorem,
        );
    List<double> rateList0 = rateList ??
        List.generate(
          4,
          (index) => Random().nextDouble() * 5,
        );
    List<Widget> widgetList0 = List.generate(
      4,
      (index) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: InitialDims.space1,
          vertical: InitialDims.space1,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [

              const FxVSpacer(),
              avatarList0[index],
              const FxVSpacer(
                big: true,
              ),
              FxText(
                AppLocalizations.of(context)!.loremshort,
                color: InitialStyle.titleTextColor,
                tag: Tag.h5,
              ),
              const FxVSpacer(),
              FxRatingBar(
                initialRate: rateList0[index],
                icon: FxSvgIcon(
                  "packages/fx_flutterap_components/assets/svgs/star.svg",
                  size: InitialDims.icon2,
                  color: InitialStyle.primaryColor,
                ),
              ),
              const FxVSpacer(),
              FxText(
                contentList0[index],
                align: TextAlign.justify,
                overFlowTag: true,
                maxLine: 3,
              ),
            ],
          ),
        ),
      ),
    );

    return SizedBox(
      height: (InitialDims.space25) * 3,
      child: CarouselSlider(
        carouselController: _carouselController1,
        items: widgetList0,
        options: CarouselOptions(
            viewportFraction: 1,
            initialPage: 2,
            disableCenter: true,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 100),
            // aspectRatio: 0.1,
            enlargeCenterPage: true),
      ),
    );
  }
}
