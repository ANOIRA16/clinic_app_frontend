// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_kernel/structure/responsive_layout.dart';

import '../components/fx_search_text_field.dart';
import '../structure/structure_dims.dart';
import '../structure/structure_styles.dart';
import 'fx_profile_drop_down_menu.dart';

class AppBarStyle extends StatefulWidget {
  final Widget languageDropDownMenu;
  final Widget themeButton;

  const AppBarStyle({
    Key? key,
    required this.languageDropDownMenu,
    required this.themeButton,
  }) : super(key: key);

  @override
  State<AppBarStyle> createState() => _AppBarStyleState();
}

class _AppBarStyleState extends State<AppBarStyle> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          //set the color of app bar.
          color: InitialStyle.background,
        ),
        child: _mainAppBarCard());
  }

  Widget _mainAppBarCard() {
    return ResponsiveLayot(
      tiny: Container(),
      phone: _phoneMainAppBarCard(),
      tablet: _phoneMainAppBarCard(),
      largTablet: _largTabletMainAppBarCard(),
      mediumComputer: _largTabletMainAppBarCard(),
      computer: _computerMainAppBarCard(),
    );
  }

  Widget _computerMainAppBarCard() {
    return Container(
      margin: EdgeInsets.only(
        left: InitialDims.space4,
        right: InitialDims.space4,
        bottom: InitialDims.space4,
      ),
      decoration: _boxDecoration(),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: InitialDims.space4, horizontal: InitialDims.space2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FxSearchTextField(
              width: InitialDims.space25 * 4,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _messages(),
                const FxHSpacer(
                  big: true,
                  factor: 2,
                ),
                _notifications(),
                const FxHSpacer(
                  big: true,
                  factor: 2,
                ),
                widget.themeButton,
                const FxHSpacer(
                  big: true,
                  factor: 2,
                ),
                widget.languageDropDownMenu,
                const FxHSpacer(
                  big: true,
                  factor: 2,
                ),
                FxprofileDropDownMenu(),
                const FxHSpacer(
                  big: true,
                  factor: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _largTabletMainAppBarCard() {
    return Container(
      margin: EdgeInsets.only(
        left: InitialDims.space4,
        right: InitialDims.space4,
        bottom: InitialDims.space4,
      ),
      decoration: _boxDecoration(),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: InitialDims.space4, horizontal: InitialDims.space2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _menu(),
                const FxHSpacer(
                  big: true,
                ),
                FxSearchTextField(
                  width: InitialDims.space25 * 3,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FxHSpacer(
                  big: true,
                ),
                widget.languageDropDownMenu,
                const FxHSpacer(
                  big: true,
                ),
                widget.themeButton,
                const FxHSpacer(
                  big: true,
                ),
                _notifications(),
                const FxHSpacer(
                  big: true,
                ),
                _messages(),
                const FxHSpacer(
                  big: true,
                ),
                FxprofileDropDownMenu(),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _phoneMainAppBarCard() {
    return Container(
      margin: EdgeInsets.only(
        left: InitialDims.space4,
        right: InitialDims.space4,
        bottom: InitialDims.space4,
      ),
      decoration: _boxDecoration(),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: InitialDims.space4, horizontal: InitialDims.space2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _menu(),
                const FxHSpacer(
                  big: true,
                ),
                _searchIcon(),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FxHSpacer(
                  big: true,
                ),
                _messages(),
                const FxHSpacer(
                  big: true,
                  factor: 2,
                ),
                _notifications(),
                const FxHSpacer(
                  big: true,
                ),
                widget.themeButton,
                const FxHSpacer(
                  big: true,
                ),
                widget.languageDropDownMenu,
              ],
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        color: InitialStyle.section,
        borderRadius: BorderRadius.all(Radius.circular(InitialDims.border3)));
  }

  Widget _messages() {
    return InkWell(
      onTap: () {},
      child: FxSvgIcon(
        "packages/fx_flutterap_components/assets/svgs/chat.svg",
        color: InitialStyle.icon,
        size: InitialDims.icon4,
      ),
    );
  }

  Widget _notifications() {
    return InkWell(
      onTap: () {},
      child: FxSvgIcon(
        "packages/fx_flutterap_components/assets/svgs/notification.svg",
        color: InitialStyle.icon,
        size: InitialDims.icon4,
      ),
    );
  }

  Widget _menu() {
    return InkWell(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: FxSvgIcon(
        "packages/fx_flutterap_components/assets/svgs/menu.svg",
        color: InitialStyle.icon,
        size: InitialDims.icon5,
      ),
    );
  }

  Widget _searchIcon() {
    return FxSvgIcon(
      "packages/fx_flutterap_components/assets/svgs/search.svg",
      color: InitialStyle.icon,
      size: InitialDims.icon5,
    );
  }


}
