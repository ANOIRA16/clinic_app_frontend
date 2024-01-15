import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';

import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxUserSearchCard extends StatelessWidget {
  final String? title;
  final String? content;
  final Widget? avatar;

  const FxUserSearchCard({
    Key? key,
    this.title,
    this.content,
    this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(InitialDims.space2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: avatar ??
                FxAvatarImage(
                  path: "packages/fx_flutterap_components/assets/images/img1.jpg",
                  borderRadius: InitialDims.space5,
                ),
          ),
          Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText(
                    AppLocalizations.of(context)!.loremshort,
                    tag:Tag.h3,
                    align: TextAlign.start,
                    color: InitialStyle.titleTextColor,
                  ),
                  const FxVSpacer(),
                  FxText(
                    AppLocalizations.of(context)!.lorem,
                    align: TextAlign.start,
                  ),
                  const FxVSpacer(
                    big: true,
                  ),
                  const FxHDivider()
                ],
              ))
        ],
      ),
    );
  }
}
