import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';

import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxProfileUsers extends StatelessWidget {
  final List<String>? nameList;
  final List<String>? descriptionList;
  final List<String>? imagePathList;
  final List<bool>? isFollowingList;

  const FxProfileUsers({
    Key? key,
    this.nameList,
    this.descriptionList,
    this.imagePathList,
    this.isFollowingList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> nemeList0 = nameList ?? [];
    List<String> descriptionList0 = descriptionList ??
        List.generate(
          nemeList0.length,
          (index) => AppLocalizations.of(context)!.loremmid,
        );
    List<String> imagePathList0 = imagePathList ??
        List.generate(
          nemeList0.length,
          (index) => "packages/fx_flutterap_components/assets/images/img1.jpg",
        );
    List<bool> isFollowingList0 =
        isFollowingList ?? List.generate(nemeList0.length, (index) => true);
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
              nemeList0.length,
              (index) => _followerCards(index, nemeList0, descriptionList0,
                  imagePathList0, isFollowingList0, context))
        ],
      ),
    );
  }

  Widget _followerCards(
      int index,
      List<String> widgetNameList,
      List<String> widgetDescriptionList,
      List<String> widgetImagePathList,
      List<bool> widgetIsFollowingList,
      BuildContext context) {
    return Container(
      padding: EdgeInsets.all(InitialDims.space2),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: FxAvatarImage(
                  path: widgetImagePathList[index],
                  borderRadius: InitialDims.space5,
                ),
              ),
              const FxHSpacer(),
              Expanded(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText(
                        widgetNameList[index],
                        tag:Tag.h3,
                        color: InitialStyle.titleTextColor,
                      ),
                      const FxVSpacer(),
                      FxText(
                        widgetDescriptionList[index],
                        align: TextAlign.start,
                      ),
                      const FxVSpacer(
                        big: true,
                      ),
                    ],
                  )),
              Expanded(
                  flex: 4,
                  child: FxButton(
                    text: widgetIsFollowingList[index]
                        ? AppLocalizations.of(context)!.follower
                        : AppLocalizations.of(context)!.follow,
                    fillColor: widgetIsFollowingList[index]
                        ? InitialStyle.disableColorLight
                        : InitialStyle.buttonColor,
                  ))
            ],
          ),
          const FxHDivider(),
        ],
      ),
    );
  }
}
