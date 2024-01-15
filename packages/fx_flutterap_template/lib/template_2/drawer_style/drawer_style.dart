import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';


import 'package:fx_flutterap_kernel/structure/responsive_layout.dart';
import '../structure/structure_dims.dart';
import '../structure/structure_styles.dart';

class DrawerStyle extends StatelessWidget {

  final Widget drawerItems;
  final String adminPanelTitle;
  final String fullName;
  final String? email;

  const DrawerStyle({Key? key,
    required this.drawerItems,
    required this.adminPanelTitle,
    required this.fullName,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: InitialStyle.background,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: InitialDims.space2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                _introductionCard(),
                //title of drawer

                Row(
                  children: [
                    ResponsiveLayot.isComputer(context)
                        ? Container()
                        : InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: InitialStyle.textColor,
                        )),
                    FxText(
                      adminPanelTitle,tag:Tag.h3,
                      color: InitialStyle.textColor,
                    ),
                  ],
                ),
                const FxVSpacer(
                  factor: 0.7,
                ),
                //creating list items of drawer
                drawerItems
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _introductionCard() {
    return Container(
      margin: EdgeInsets.only(
        top: (InitialDims.space5),
        bottom: (InitialDims.space5),
        // left: (InitialDims.space2),
        // right: (InitialDims.space2),
      ),
      padding: EdgeInsets.only(
        right: InitialDims.space2,
        // left: InitialDims.space2,
        top: InitialDims.space1,
        bottom: InitialDims.space1+InitialDims.space1,
      ),
      decoration: _boxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FxHSpacer(),
          FxAvatarImage(
            path: "assets/images/flutterap.png",
            borderRadius: (InitialDims.border4),
          ),
          const FxHSpacer(
            big: true,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: InitialDims.space2,
            ),
            child: Column(
              children: [
                FxText(
                  fullName,tag:Tag.h5,
                  color: InitialStyle.primaryDarkColor,
                ),
                Icon(
                  Icons.edit,
                  size: InitialDims.icon3,
                )
              ],
            ),
          )
        ],
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
}

