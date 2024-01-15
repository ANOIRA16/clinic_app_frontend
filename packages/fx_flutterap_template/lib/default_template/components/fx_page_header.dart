import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_bread_crumb/fx_bread_crumb_navigator.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import '../structure/structure_dims.dart';
import '../structure/structure_styles.dart';

class FxPageHeader extends StatelessWidget {
  final String title;
  final  String? firstRoute;

  const FxPageHeader({Key? key,
    required this.title,
     this.firstRoute,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:
      EdgeInsets.symmetric(horizontal: InitialDims.space5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText(
            title,
            tag: Tag.h2,
            isBold: true,
            color: InitialStyle.titleTextColor,
          ),
          const FxVSpacer(),
          FxBreadCrumbNavigator.simple(
            firstRoute:firstRoute?? title,
            textColor: InitialStyle.buttonColor,

          ),
          const FxVSpacer(),
        ],
      ),
    );
  }
}


