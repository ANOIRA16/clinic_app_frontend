import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxProfileCard extends StatelessWidget {
  final String? imagePath;
  final String? avatarImagePath;
  final String? name;
  final String? jobName;
  final String? content;
  final int? contentNumber;
  final int? followerNumber;
  final int? likeNumber;

  const FxProfileCard({
    Key? key,
    this.imagePath,
    this.avatarImagePath,
    this.name,
    this.jobName,
    this.content,
    this.contentNumber,
    this.followerNumber,
    this.likeNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxCard(
      padding: EdgeInsets.all(InitialDims.space0),
      bodyPadding: EdgeInsets.all(InitialDims.space0),
      margin: EdgeInsets.all(InitialDims.space0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  imagePath ??
                      "packages/fx_flutterap_components/assets/images/img2.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                  child: Container(
                alignment: Alignment.center,
                child: CustomSingleChildLayout(
                  delegate: MySingleChildDelegate(),
                  child: FxAvatarImage(
                    path: avatarImagePath ??
                        "packages/fx_flutterap_components/assets/images/img1.jpg",
                    borderRadius: (InitialDims.space10),
                  ),
                ),
              ))
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: InitialDims.space5,
              vertical: InitialDims.space5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FxVSpacer(
                  big: true,
                  factor: 5,
                ),
                FxText(
                  name ?? AppLocalizations.of(context)!.title,
                  tag: Tag.h3,
                ),
                const FxVSpacer(
                  big: true,
                  factor: 2,
                ),
                FxText(
                  jobName ?? AppLocalizations.of(context)!.loremshort,
                  color: InitialStyle.secondaryDarkColor,
                ),
                const FxVSpacer(
                  big: true,
                  factor: 2,
                ),
                FxText(
                  content ?? AppLocalizations.of(context)!.lorem,
                  align: TextAlign.justify,
                  overFlowTag: true,
                  maxLine: 3,
                ),
                const FxVSpacer(
                  big: true,
                  factor: 2,
                ),
                FxButton(
                  text: AppLocalizations.of(context)!.editprofile,
                  icon: Icon(
                    Icons.edit,
                    color: InitialStyle.primaryLightColor,
                    size: InitialDims.icon2,
                  ),
                ),
                const FxVSpacer(
                  big: true,
                  factor: 2,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FxText(
                            AppLocalizations.of(context)!.content,
                            tag: Tag.h5,
                            isBold: true,
                            color: InitialStyle.informationColorRegular,
                          ),
                          const FxVSpacer(
                            big: true,
                          ),
                          FxText(
                            (contentNumber ?? 110).toString(),
                            tag: Tag.h5,
                            isBold: true,
                            color: InitialStyle.informationColorRegular,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FxText(
                            AppLocalizations.of(context)!.follower,
                            tag: Tag.h5,
                            isBold: true,
                            color: InitialStyle.successColorDark,
                          ),
                          const FxVSpacer(
                            big: true,
                          ),
                          FxText(
                            (followerNumber ?? 110).toString(),
                            tag: Tag.h5,
                            isBold: true,
                            color: InitialStyle.successColorDark,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FxText(
                            AppLocalizations.of(context)!.like,
                            tag: Tag.h5,
                            isBold: true,
                            color: InitialStyle.dangerColorRegular,
                          ),
                          const FxVSpacer(
                            big: true,
                          ),
                          FxText(
                            (likeNumber ?? 110).toString(),
                            tag: Tag.h5,
                            isBold: true,
                            color: InitialStyle.dangerColorRegular,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MySingleChildDelegate extends SingleChildLayoutDelegate {
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // TODO: implement getPositionForChild

    return Offset(size.width * (1 / 2) - childSize.width * (1 / 2),
        size.height * (1) - childSize.height * (1 / 2));
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return false;
  }
}
