import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_widget.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_tab_bar/fx_top_tab_bar_navigation.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_timeline/showcase/fx_custom_timeline.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card_decoration.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import 'fx_profile_images.dart';
import 'fx_profile_income.dart';
import 'fx_profile_users.dart';

class FxProfileTabBarCard extends StatelessWidget {
  const FxProfileTabBarCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int num = 4;
    List<String> titleList = [
      AppLocalizations.of(context)!.timeline,
      AppLocalizations.of(context)!.images,
      AppLocalizations.of(context)!.followers,
      AppLocalizations.of(context)!.income,
    ];

    List<Widget> tabList = List.generate(
        num,
        (index) => FxText(
              titleList[index],
              color: InitialStyle.textColor,
              size: InitialDims.smallFontSize,
              tag: Tag.h3,
              isBold: true,
            ));
    List<Widget> indicatorList = [
      FxAvatarImage(
        path: "packages/fx_flutterap_components/assets/images/avatar1.png",
        borderRadius: InitialDims.space5,
      ),
      FxAvatarWidget(
          backGroundColor: InitialStyle.specificColor,
          widget: FxText(
            "L",
            tag: Tag.h3,
            color: InitialStyle.primaryLightColor,
          )),
      FxAvatarWidget(
          backGroundColor: InitialStyle.primaryLightColor,
          widget: FxSvgIcon(
            "packages/fx_flutterap_components/assets/svgs/gallery.svg",
            size: InitialDims.icon3,
            color: InitialStyle.primaryDarkColor,
          )),
      FxAvatarImage(
        path: "packages/fx_flutterap_components/assets/images/avatar4.png",
        borderRadius: InitialDims.space5,
      ),
    ];

    Widget content1() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: InitialDims.space1,
          horizontal: InitialDims.space1,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxText(
                AppLocalizations.of(context)!.loremshort,
                tag: Tag.h3,
                size: InitialDims.normalFontSize,
                color: InitialStyle.titleTextColor,
                align: TextAlign.start,
              ),
              const FxVSpacer(
                factor: 0.5,
              ),
              FxText(
                AppLocalizations.of(context)!.lorem,
                align: TextAlign.justify,
                color: InitialStyle.textColor,
                size: InitialDims.subtitleFontSize,
                overFlowTag: true,
                maxLine: 1,
              ),
              const FxVSpacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.access_time,
                    size: InitialDims.icon2,
                    color: InitialStyle.secondaryTextColor,
                  ),
                  const FxHSpacer(),
                  FxText(
                    "9:40 AM",
                    tag: Tag.h5,
                    color: InitialStyle.secondaryTextColor,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget content2() {
      double imageSize = (InitialDims.space13 );
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: InitialDims.space1,
          horizontal: InitialDims.space1,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: InitialDims.space1,
                runSpacing: InitialDims.space1,
                children: [
                  Image.asset(
                    "packages/fx_flutterap_components/assets/images/img1.png",
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
                  const FxHSpacer(),
                  Image.asset(
                    "packages/fx_flutterap_components/assets/images/img2.png",
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
                  const FxHSpacer(),
                  Image.asset(
                    "packages/fx_flutterap_components/assets/images/img3.png",
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const FxVSpacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.access_time,
                    size: InitialDims.icon2,
                    color: InitialStyle.secondaryTextColor,
                  ),
                  const FxHSpacer(),
                  FxText(
                    "20.10.2018",
                    tag: Tag.h5,
                    color: InitialStyle.secondaryTextColor,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    List<Widget> contentList = [
      content1(),
      content1(),
      content2(),
      content1(),
    ];
    List<String> imagPathList = List.generate(
      70,
      (index) => "packages/fx_flutterap_components/assets/images/img2.jpg",
    );
    List<String> nameList = List.generate(
      70,
      (index) => "Jack shephard",
    );
    List<bool> isFollowingList = List.generate(
      70,
      (index) {
        if (index == 2) {
          return false;
        }
        if (index == 5) {
          return false;
        }
        return true;
      },
    );

    List<List<String>> contentList2 = [
      ...List.generate(10, (index) {
        return [
          ...List.generate(3, (index2) {
            if (index2 == 0) {
              return "07.11.2021";
            }
            if (index2 == 1) {
              return (Random().nextInt(50)).toString();
            }
            if (index2 == 2) {
              return "${AppLocalizations.of(context)!.currencyunit}127000";
            }
            return AppLocalizations.of(context)!.loremshort;
          })
        ];
      }),
    ];

    List<Widget> pageList = [
      FxCustomTimeLine(
        indicatorList: indicatorList,
        contentList: contentList,
      ),
      FxProfileImagesCard(
        imagePathList: imagPathList,
      ),
      FxProfileUsers(
        nameList: nameList,
        isFollowingList: isFollowingList,
      ),
      FxProfileIncome(
        contentList: contentList2,
      )
    ];

    return Container(
      decoration: FxCardDecoration().decoration,
      padding: EdgeInsets.all(InitialDims.space5),
      child: SizedBox(
        width: double.infinity,
        child:
            FxTopTabBarNavigation(pageWidgets: pageList, tabWidgets: tabList),
      ),
    );
  }
}
