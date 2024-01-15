// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_kernel/structure/responsive_layout.dart';
import '../components/fx_search_text_field.dart';
import '../structure/structure_dims.dart';
import '../structure/structure_styles.dart';

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
      child: _mainAppBarCard()

    );
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
      margin: EdgeInsets.all(InitialDims.space5),
      decoration: _boxDecoration(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: (InitialDims.space2) * 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: InitialDims.space2),
                child: const FxSearchTextField(),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.themeButton,
                const FxHSpacer(
                  big: true,
                ),
                _setting(),
                const FxHSpacer(
                  big: true,
                  factor: 2,
                ),
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
                widget.languageDropDownMenu
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _largTabletMainAppBarCard() {
    return Container(
      margin: EdgeInsets.all(InitialDims.space5),
      decoration: _boxDecoration(),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: InitialDims.space2, horizontal: InitialDims.space2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _menu(),
                  const FxHSpacer(
                    big: true,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: InitialDims.space2),
                      child: const FxSearchTextField(),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.themeButton,
                const FxHSpacer(
                  big: true,
                ),
                _setting(),
                const FxHSpacer(
                  big: true,
                ),
                _messages(),
                const FxHSpacer(
                  big: true,
                ),
                _notifications(),
                const FxHSpacer(
                  big: true,
                ),
                widget.languageDropDownMenu
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _phoneMainAppBarCard() {
    return Container(
      margin: EdgeInsets.all(InitialDims.space5),
      decoration: _boxDecoration(),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: InitialDims.space2, horizontal: InitialDims.space2),
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
                const FxHSpacer(
                  big: true,
                ),
                widget.themeButton,
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _setting(),
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
                widget.languageDropDownMenu
              ],
            ),
          ],
        ),
      ),
    );
  }



  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        color: InitialStyle.primaryLightColor,
        border: Border.all(width: 1.5, color: InitialStyle.primaryDarkColor),
        borderRadius:
            BorderRadius.all(Radius.circular(InitialDims.border3)));
  }

  Widget _setting() {
    return InkWell(
      onTap: () {},
      child: FxSvgIcon(
        "packages/fx_flutterap_components/assets/svgs/setting.svg",
        color: InitialStyle.primaryDarkColor,
        size: InitialDims.icon5,
      ),
    );
  }

  Widget _messages() {
    return InkWell(
      onTap: () {},
      child: FxSvgIcon(
        "packages/fx_flutterap_components/assets/svgs/ChatsCircle.svg",
        color: InitialStyle.primaryDarkColor,
        size: InitialDims.icon5,
      ),
    );
  }

  Widget _notifications() {
    return InkWell(
      onTap: () {},
      child: FxSvgIcon(
        "packages/fx_flutterap_components/assets/svgs/notificationbing.svg",
        color: InitialStyle.primaryDarkColor,
        size: InitialDims.icon5,
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
        color: InitialStyle.primaryDarkColor,
        size: InitialDims.icon5,
      ),
    );
  }

  Widget _searchIcon() {
    return FxSvgIcon(
      "packages/fx_flutterap_components/assets/svgs/search.svg",
      color: InitialStyle.primaryDarkColor,
      size: InitialDims.icon5,
    );
  }

}
