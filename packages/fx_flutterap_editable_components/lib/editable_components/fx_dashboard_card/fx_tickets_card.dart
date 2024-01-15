import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_label/fx_content_label.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_table/fx_simple_table.dart';

import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import 'package:fx_flutterap_kernel/structure/responsive_layout.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FxTicketsCard extends StatelessWidget {
  final List<List<Widget>>? rowContent;
  final List<Widget>? titleContent;

  const FxTicketsCard({
    Key? key,
    this.rowContent,
    this.titleContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<Widget>> rowContent0 = rowContent ??
        [
          [
            _bioTile(
                "packages/fx_flutterap_components/assets/images/avatar1.png",
                AppLocalizations.of(context)!.name,
                AppLocalizations.of(context)!.loremshort),
            _descriptionTile(AppLocalizations.of(context)!.loremmid),
            _dateTimeTile("05${AppLocalizations.of(context)!.oct} | 10:00-12:45"),
            FxContentLabel(
              isUnique: true,
              size: InitialDims.icon5,
              color: InitialStyle.successColorLight,
              textColor: InitialStyle.successColorDark,
              text: AppLocalizations.of(context)!.successful,
            ),
            Container(),
          ],
          [
            _bioTile(
                "packages/fx_flutterap_components/assets/images/avatar3.png",
                AppLocalizations.of(context)!.name,
                AppLocalizations.of(context)!.loremshort),
            _descriptionTile(AppLocalizations.of(context)!.loremmid),
            _dateTimeTile("05${AppLocalizations.of(context)!.oct} | 10:00-12:45"),
            FxContentLabel(
              isUnique: true,
              size: InitialDims.icon5,
              color: InitialStyle.dangerColorLight,
              textColor: InitialStyle.dangerColorDark,
              text: AppLocalizations.of(context)!.unsuccessful,
            ),
            Container(),
          ],
          [
            _bioTile(
                "packages/fx_flutterap_components/assets/images/avatar4.png",
                AppLocalizations.of(context)!.name,
                AppLocalizations.of(context)!.loremshort),
            _descriptionTile(AppLocalizations.of(context)!.loremmid),
            _dateTimeTile("05${AppLocalizations.of(context)!.oct} | 10:00-12:45"),
            FxContentLabel(
              isUnique: true,
              size: InitialDims.icon5,
              color: InitialStyle.warningColorLight,
              textColor: InitialStyle.warningColorDark,
              text: AppLocalizations.of(context)!.pending,
            ),
            Container(),
          ],
        ];
    List<Widget> titleContent0 = titleContent ??
        [
          FxText(
            AppLocalizations.of(context)!.firstname,
            tag: Tag.h4,
            color: InitialStyle.textColor,
            isBold: true,
          ),
          FxText(
            AppLocalizations.of(context)!.description,
            tag: Tag.h4,
            color: InitialStyle.textColor,
            isBold: true,
          ),
          FxText(
            AppLocalizations.of(context)!.date,
            tag: Tag.h4,
            color: InitialStyle.textColor,
            isBold: true,
          ),
          FxText(
            AppLocalizations.of(context)!.status,
            tag: Tag.h4,
            size: InitialDims.normalFontSize,
            color: InitialStyle.textColor,
            isBold: true,
          ),
          InkWell(
            onTap: () {},
            child: FxSvgIcon(
              "packages/fx_flutterap_components/assets/svgs/refresh.svg",
              color: InitialStyle.onSecondaryColor,
              size: InitialDims.icon3,
            ),
          ),
        ];

    return SizedBox(
      height: InitialDims.space25 * 3,
      child: FxSimpleTable(
        rowsContent: rowContent0,
        headingColor: InitialStyle.secondaryDarkColor,
        dataRowHeight: InitialDims.space20,
        columnTitle: titleContent0,
        verticalModeBreakPoint: ResponsiveLayot.tabletLimit,
      ),
    );
  }

  Widget _bioTile(String avatarpath, String name, String description) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FxAvatarImage(path: avatarpath),
        const FxHSpacer(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FxText(
                name,
                tag: Tag.h4,
                color: InitialStyle.titleTextColor,
              ),
              const FxVSpacer(),
              FxText(
                description,
                tag: Tag.h5,
                color: InitialStyle.secondaryTextColor,
                overFlowTag: true,
                align: TextAlign.start,
                maxLine: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _descriptionTile(String description) {
    return FxText(
      description,
      tag: Tag.h4,
      color: InitialStyle.titleTextColor,
      align: TextAlign.start,
    );
  }

  Widget _dateTimeTile(String dateTime) {
    return FxText(
      dateTime,
      tag: Tag.h4,
      color: InitialStyle.textColor,
    );
  }
}
