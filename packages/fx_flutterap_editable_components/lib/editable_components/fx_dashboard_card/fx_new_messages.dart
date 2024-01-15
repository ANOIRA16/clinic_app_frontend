// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_label/fx_label.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxNewMessages extends StatefulWidget {
  final List<String>? nameList;
  final List<bool>? valueList;
  final List<String> messageList;
  final List<String>? dateList;
  final List<Widget>? iconList;

  const FxNewMessages({
    Key? key,
    this.nameList,
    this.valueList,
    required this.messageList,
    this.dateList,
    this.iconList,
  }) : super(key: key);

  @override
  State<FxNewMessages> createState() => _FxNewMessagesState();
}

class _FxNewMessagesState extends State<FxNewMessages> {
  @override
  Widget build(BuildContext context) {
    List<String> nameList = widget.nameList ??
        List.generate(
          widget.messageList.length,
          (index) => AppLocalizations.of(context)!.name,
        );

    List<bool> valueList = widget.valueList ??
        List.generate(
          widget.messageList.length,
          (index) => true,
        );
    List<String> dateList = widget.dateList ??
        List.generate(
          widget.messageList.length,
          (index) => "9:40 AM",
        );

    List<Widget> iconList = widget.iconList ??
        [
           FxAvatarImage(
              path: "packages/fx_flutterap_components/assets/images/avatar4.png"),
          FxLabel(
            isUnique: false,
            color: InitialStyle.successColorRegular,

            widget: const FxAvatarImage(
                path:
                    "packages/fx_flutterap_components/assets/images/avatar5.png"),

          ),
           FxAvatarImage(
              path: "packages/fx_flutterap_components/assets/images/avatar1.png"),
          FxLabel(
            isUnique: false,
            color: InitialStyle.dangerColorRegular,
            widget:  const FxAvatarImage(
                path:
                    "packages/fx_flutterap_components/assets/images/avatar2.png",

            ),

          ),
          FxLabel(
            isUnique: false,
            color: InitialStyle.dangerColorRegular,
            widget:  const FxAvatarImage(
                path:
                    "packages/fx_flutterap_components/assets/images/avatar3.png",

            ),

          ),
        ];

    return Container(
      height: (InitialDims.space24) * 4,
      padding: EdgeInsets.symmetric(
        horizontal: InitialDims.space1,
        vertical: InitialDims.space1,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
                widget.messageList.length,
                (index) => _messageCards(index, dateList, iconList,
                    widget.messageList, nameList, valueList, context))
          ],
        ),
      ),
    );
  }

  Widget _messageCards(
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
            vertical: InitialDims.space2,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex:3,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    iconList[index]
                  ],
                ),
              ),
              const FxHSpacer(),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText(
                      widgetNameList[index],
                      tag: Tag.h4,
                      color: InitialStyle.titleTextColor,
                    ),
                    const FxVSpacer(
                      factor: 0.5,
                    ),
                    FxText(
                      widgetDescriptionList[index],
                      tag: Tag.h5,
                      color: InitialStyle.textColor,
                      align: TextAlign.start,
                      overFlowTag: true,
                      maxLine: 1,
                    ),
                    const FxVSpacer(
                      factor: 0.5,
                    ),
                    FxText(
                      widgetDateList[index],
                      isBold: true,
                      tag: Tag.h6,
                      color: InitialStyle.titleTextColor,
                      align: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        index != (widgetNameList.length - 1) ? const FxHDivider() : Container()
      ],
    );
  }
}
