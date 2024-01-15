import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_label/fx_content_label.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxSocialNetworkVisits extends StatelessWidget {
  final List<String>? descriptionList;
  final String? instagramVisits;
  final String? facebookVisits;
  final String? dribbleVisits;

  const FxSocialNetworkVisits({
    Key? key,
    this.descriptionList,
    this.instagramVisits,
    this.facebookVisits,
    this.dribbleVisits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> titleList = [
      "Instagram",
      "Facebook",
      "Dribble",
    ];

    List<String> descriptionList0 = descriptionList ??
        List.generate(
          titleList.length,
          (index) => AppLocalizations.of(context)!.loremshort,
        );

    List<String> numberList0 = [
      instagramVisits ?? "25,566",
      facebookVisits ?? "14,000",
      dribbleVisits ?? "114,000",
    ];

    List<String> imgeList0 = [
      "packages/fx_flutterap_components/assets/images/instagram.png",
      "packages/fx_flutterap_components/assets/images/facebook.png",
      "packages/fx_flutterap_components/assets/images/dribble.png",
    ];

    return SizedBox(
      height: (InitialDims.space22) * 3,
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: InitialDims.space1,
            vertical: InitialDims.space1,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FxText(
                      "313",
                      size: InitialDims.midTitleFontSize,
                      color: InitialStyle.titleTextColor,
                      isBold: true,
                    ),
                    const FxHSpacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FxSvgIcon(
                          "packages/fx_flutterap_components/assets/svgs/arrowup2.svg",
                          size: InitialDims.icon2,
                          color: InitialStyle.successColorRegular,
                        ),
                        FxText(
                          "25%",
                          tag: Tag.h6,
                          color: InitialStyle.successColorRegular,
                          align: TextAlign.justify,
                        ),
                      ],
                    )
                  ],
                ),
                FxText(
                  AppLocalizations.of(context)!.lastyearvisits,
                  tag: Tag.h5,
                  color: InitialStyle.textColor,
                ),
                const FxVSpacer(
                  factor: 2,
                ),
                ...List.generate(
                    titleList.length,
                    (index) => _info(index, titleList, descriptionList0,
                        numberList0, imgeList0, context))
              ],
            ),
          )),
    );
  }

  Widget _info(
      int index,
      List<String> widgetTitleList,
      List<String> widgetDescriptionList,
      List<String> widgetNumbrerList,
      List<String> imagePathList,
      BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: InitialDims.space3,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxAvatarImage(
            path: imagePathList[index],
            size: InitialDims.icon3,
          ),
          const FxHSpacer(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FxText(
                      widgetTitleList[index],
                      tag: Tag.h5,
                      color: InitialStyle.titleTextColor,
                      isBold: true,
                    ),
                    Row(
                      children: [
                        FxText(
                          widgetNumbrerList[index],
                          isBold: true,
                          tag: Tag.h5,
                          color: InitialStyle.titleTextColor,
                          align: TextAlign.start,
                        ),
                        const FxHSpacer(),
                        FxContentLabel(
                          isUnique: true,
                          size: InitialDims.icon3,
                          color: InitialStyle.successColorLight,
                          labelContent: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              FxSvgIcon(
                                "packages/fx_flutterap_components/assets/svgs/arrowup2.svg",
                                size: InitialDims.icon2,
                                color: InitialStyle.successColorRegular,
                              ),
                              FxText(
                                "25%",
                                tag: Tag.h6,
                                color: InitialStyle.successColorRegular,
                                align: TextAlign.justify,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const FxVSpacer(
                  factor: 0.5,
                ),
                FxText(
                  widgetDescriptionList[index],
                  color: InitialStyle.secondaryTextColor,
                  tag: Tag.h6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
