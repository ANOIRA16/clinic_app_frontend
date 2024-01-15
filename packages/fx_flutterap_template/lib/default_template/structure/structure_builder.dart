// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fx_flutterap_kernel/structure/responsive_layout.dart';
import 'package:fx_flutterap_kernel/structure/global_variables.dart';
import 'structure_config.dart';
import 'structure_dims.dart';
import 'structure_performer.dart';
import 'structure_styles.dart';


class StructureBuilder extends StatelessWidget {
  final Widget child;
  final Widget? appbar;
  final Widget? drawer;

  const StructureBuilder({
    Key? key,
    required this.child,
    this.appbar,
    this.drawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool hasDrawer = drawer == null ? false : true;
    bool hasAppbar = appbar == null ? false : true;
    Widget drawerWidget = drawer ?? Container();
    Widget appbarWidget = appbar ?? Container();

    appBar() {
      if (hasAppbar) {
        if ((ResponsiveLayot.isTinyLimit(context) ||
            ResponsiveLayot.isTinyHightLimit(context))) {
          return Container();
        } else {
          return (appbarWidget);
        }
      } else {
        Container();
      }
    }

    Widget body() {
      return Stack(
        children: [
          Container(
              margin:EdgeInsets.only(top:appbar==null
                  ?InitialDims.space0
                  :InitialDims.space23,),
              child: child

          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
                height: InitialDims.space23,
                child: appBar() ?? Container()),
          ),
        ],
      );
    }

    return StructurePerformer(
      dims: InitialDims(context: context),
      styles: nightMode
          ? DarkStyle(
        context,)
          : InitialStyle(
        context,
      ),
      configs: (selectedValue == "FA" || selectedValue == "AR")
          ? LanguageConfig()
          : InitialConfig(),
      body: SafeArea(
          child: Container(
            padding:  EdgeInsets.all(ResponsiveLayot.isPhone(context)
                ?InitialDims.space0
                :InitialDims.space4),
            color: InitialStyle.background,
            child: Scaffold(
              backgroundColor: InitialStyle.background,
                body: ResponsiveLayot(
                  tiny: Container(),
                  phone: body(),
                  tablet: Row(
                    children: [
                      Expanded(
                        child: body(),
                      ),
                    ],
                  ),
                  largTablet: Row(
                    children: [
                      Expanded(
                        child: body(),
                      ),
                    ],
                  ),
                  mediumComputer: Row(
                    children: [
                      Expanded(
                        child: body(),
                      ),
                    ],
                  ),
                  computer: Row(
                    children: [
                      hasDrawer
                          ? Expanded(
                        flex: _sidebarFlex(width),
                        child: drawerWidget,
                      )
                          : Container(),
                      Expanded(
                        flex: 33,
                        child: body(),
                      ),
                    ],
                  ),
                ),
                drawer:drawer==null?null : SizedBox(
                  width: (InitialDims.space25) * 3,
                  child: ResponsiveLayot(
                    tiny: drawerWidget,
                    phone: drawerWidget,
                    tablet: drawerWidget,
                    largTablet: drawerWidget,
                    mediumComputer: drawerWidget,
                    computer: Container(),
                  ),
                )),
          )),
    );
  }

  int _sidebarFlex(double width) {
    if (width > 1400) {
      return 8;
    }
    if (width <= 1400 && width >= 1300) {
      return 9;
    }
    if (width <= 1300 && width >= 1200) {
      return 10;
    }
    if (width <= 1200) {
      return 11;
    } else {
      return 7;
    }
  }
}