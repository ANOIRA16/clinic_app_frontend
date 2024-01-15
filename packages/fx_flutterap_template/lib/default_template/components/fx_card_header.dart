import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_information_button.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_icon_text.dart';

import '../structure/structure_dims.dart';
import '../structure/structure_styles.dart';

class FxCardHeader extends StatelessWidget {
  final String title;
  final String? information;
  final GlobalKey? informationKey;

  const FxCardHeader({Key? key,
    required this.title,
     this.information,
     this.informationKey,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: FxIconText(
            title.toUpperCase(),
            color: InitialStyle.titleTextColor,
            size: InitialDims.normalFontSize,
            isBold: true,
            icon: Icon(
              Icons.circle,
              size: InitialDims.icon1,
              color: InitialStyle.primaryColor,
            ),
          ),
        ),
        information==null?Container():FxInformationButton(
          key: informationKey,
          dialogeText: information??"",
        ),
      ],
    );
  }
}


