import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxNewUsers extends StatefulWidget {
  final List<String>? nameList;
  final List<bool>? valueList;
  final List<String> descriptionList;
  final List<String>? dateList;
  final List<Widget>? iconList;

  const FxNewUsers({
    Key? key,
    this.nameList,
    this.valueList,
    required this.descriptionList,
    this.dateList,
    this.iconList,
  }) : super(key: key);

  @override
  State<FxNewUsers> createState() => _FxNewUsersState();
}

class _FxNewUsersState extends State<FxNewUsers> {
  @override
  Widget build(BuildContext context) {
    List<String> nameList = widget.nameList ??
        List.generate(
          widget.descriptionList.length,
          (index) => AppLocalizations.of(context)!.name,
        );

    List<bool> valueList = widget.valueList ??
        List.generate(
          widget.descriptionList.length,
          (index) => true,
        );
    List<String> dateList = widget.dateList ??
        List.generate(
          widget.descriptionList.length,
          (index) => "9:40 AM",
        );

    List<Widget> iconList = widget.iconList ??
        [
          ...List.generate(
            widget.descriptionList.length,
            (index) => FxAvatarImage(
                path:
                    "packages/fx_flutterap_components/assets/images/avatar${index + 1}.png"),
          )
        ];

    return Container(
      height: (InitialDims.space21) * 4,
      padding: EdgeInsets.symmetric(
        horizontal: InitialDims.space1,
        vertical: InitialDims.space1,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const FxVSpacer(),
            ...List.generate(
                widget.descriptionList.length,
                (index) => _userCards(index, dateList, iconList,
                    widget.descriptionList, nameList, valueList, context))
          ],
        ),
      ),
    );
  }

  Widget _userCards(
      int index,
      List<String> widgetDateList,
      List<Widget> iconList,
      List<String> widgetDescriptionList,
      List<String> widgetNameList,
      List<bool> widgetValueList,
      BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: InitialDims.space3,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconList[index],
              const FxHSpacer(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText(
                      widgetNameList[index],
                      tag:Tag.h4,
                      color: InitialStyle.titleTextColor,
                    ),
                    const FxVSpacer(),
                    FxText(
                      widgetDescriptionList[index],
                      tag:Tag.h4,
                      color: InitialStyle.textColor,
                      overFlowTag: true,
                      align: TextAlign.start,
                      maxLine: 1,
                    ),
                  ],
                ),
              ),
              const FxHSpacer(
                factor: 3,
              ),
              FxButton(
                text: AppLocalizations.of(context)!.show,
              )
            ],
          ),
        ),
        index != (widgetNameList.length - 1) ? const FxHDivider() : Container()
      ],
    );
  }
}
