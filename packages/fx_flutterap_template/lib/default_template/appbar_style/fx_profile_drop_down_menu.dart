// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_drop_down/fx_drop_down_button.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import '../structure/structure_dims.dart';
import '../structure/structure_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class FxprofileDropDownMenu extends StatefulWidget {
  const FxprofileDropDownMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<FxprofileDropDownMenu> createState() => _FxprofileDropDownMenuState();
}

class _FxprofileDropDownMenuState extends State<FxprofileDropDownMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> menuWidgetList = [
      _dropDownItemstart(
        AppLocalizations.of(context)!.fullname,
        AppLocalizations.of(context)!.admin,
            () {},
        "packages/fx_flutterap_components/assets/svgs/profilecircle.svg",
      ),
      _dropDownItems(
        AppLocalizations.of(context)!.profile,
            () {},
        "packages/fx_flutterap_components/assets/svgs/profilecircle.svg",
      ),
      _dropDownItems(
        AppLocalizations.of(context)!.setting,
            () {},
        "packages/fx_flutterap_components/assets/svgs/Gear.svg",
      ),
      _dropDownItems(
        AppLocalizations.of(context)!.help,
            () {},
        "packages/fx_flutterap_components/assets/svgs/Question.svg",
      ),
      _dropDownItemsend(
        AppLocalizations.of(context)!.logout,
            () {},
        "packages/fx_flutterap_components/assets/svgs/SignOut.svg",
      ),
    ];
    List<void Function()> menufunctionList = [
          () {},
          () {},
          () {},
          () {},
          () {},
    ];

    return FxDropdownButton(
      num: menuWidgetList.length,
      menuWidgetList: menuWidgetList,
      menufunctionList: menufunctionList,
      buttonWidget: _button(),
      dropdownWidth: InitialDims.space23 * 2,
      dropdownItemsHeight: InitialDims.space15,
    );
  }

  Widget _button() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundColor: InitialStyle.border,
              radius: InitialDims.icon5 * 0.7,
            ),
            FxAvatarImage(
              path: "packages/fx_flutterap_components/assets/images/avatar1.png",
              size: InitialDims.icon3,
            ),
          ],
        ),
        const FxHSpacer(),
        FxSvgIcon(
          "packages/fx_flutterap_components/assets/svgs/down.svg",
          size: InitialDims.icon2,
          color: InitialStyle.textColor,
        )
      ],
    );
  }

  Widget _dropDownItems(String title, void Function() onTap, String iconPath) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: InitialDims.space3,
          vertical: InitialDims.space2,
        ),
        child: Row(
          children: [
            FxSvgIcon(
              iconPath,
              size: InitialDims.icon4,
              color: InitialStyle.icon,
            ),
            FxHSpacer(),
            FxText(
              title,
              color: InitialStyle.textColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _dropDownItemsend(String title, void Function() onTap, String iconPath) {
    return InkWell(
      onTap: () {
        if (title == AppLocalizations.of(context)!.logout) {
          //Navigator.pushReplacementNamed(context, .routeName);
        } else {
          onTap();
        }
      },
      child: Column(
        children: [
          FxHDivider(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: InitialDims.space3,
              vertical: InitialDims.space2,
            ),
            child: Row(
              children: [
                FxSvgIcon(
                  iconPath,
                  size: InitialDims.icon4,
                  color: InitialStyle.icon,
                ),
                FxHSpacer(),
                FxText(
                  title,
                  tag: Tag.h4,
                  isBold: true,
                  color: InitialStyle.icon,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropDownItemstart(
      String name,
      String title,
      void Function() onTap,
      String iconPath,
      ) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: InitialDims.space3,
              vertical: InitialDims.space2,
            ),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: InitialStyle.border,
                      radius: InitialDims.icon3,
                    ),
                    FxAvatarImage(
                      path:
                      "packages/fx_flutterap_components/assets/images/avatar1.png",
                      size: InitialDims.icon3,
                    ),
                  ],
                ),
                FxHSpacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText(
                      name,
                      isBold: true,
                      tag: Tag.h5,
                      color: InitialStyle.titleTextColor,
                    ),
                    FxText(
                      title,
                      isBold: true,
                      tag: Tag.h5,
                    ),
                  ],
                ),
              ],
            ),
          ),
          FxHDivider(),
        ],
      ),
    );
  }
}
