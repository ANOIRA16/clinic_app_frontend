import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_label/fx_content_label.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxRecentComments extends StatefulWidget {
  final List<String>? nameList;
  final List<bool>? valueList;
  final List<String> messageList;
  final List<String>? dateList;
  final List<Widget>? iconList;

  const FxRecentComments({
    Key? key,
    this.nameList,
    this.valueList,
    required this.messageList,
    this.dateList,
    this.iconList,
  }) : super(key: key);

  @override
  State<FxRecentComments> createState() => _FxRecentCommentsState();
}

class _FxRecentCommentsState extends State<FxRecentComments> {
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
          (index) => (index == 1 || index == 3) ? true : false,
        );
    List<String> dateList = widget.dateList ??
        List.generate(
          widget.messageList.length,
          (index) => "${AppLocalizations.of(context)!.apri} 14, 2016",
        );

    List<Widget> iconList = widget.iconList ??
        [
          ...List.generate(
            widget.messageList.length,
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
            ...List.generate(
                widget.messageList.length,
                (index) => _commentCards(index, dateList, iconList,
                    widget.messageList, nameList, valueList, context))
          ],
        ),
      ),
    );
  }

  Widget _commentCards(
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
                      tag: Tag.h4,
                      color: InitialStyle.titleTextColor,
                    ),
                    const FxVSpacer(
                      factor: 0.5,
                    ),
                    FxText(
                      widgetDescriptionList[index],
                      tag: Tag.h4,
                      color: InitialStyle.textColor,
                      overFlowTag: true,
                      align: TextAlign.start,
                      maxLine: 4,
                    ),
                    const FxVSpacer(),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        FxText(
                          widgetDateList[index],
                          tag: Tag.h5,
                          color: InitialStyle.secondaryTextColor,
                          align: TextAlign.start,
                        ),
                        const FxHSpacer(),
                        FxContentLabel(
                          isUnique: true,
                          size: InitialDims.icon5,
                          color: InitialStyle.primaryLightColor,
                          textColor: InitialStyle.primaryDarkColor,
                          text: AppLocalizations.of(context)!.pending,
                        ),
                        const FxHSpacer(),
                        FxSvgIcon(
                          "packages/fx_flutterap_components/assets/svgs/Pencil.svg",
                          size: InitialDims.icon2,
                          color: InitialStyle.icon,
                        ),
                        const FxHSpacer(
                          factor: 0.5,
                        ),
                        widgetValueList[index]
                            ? FxSvgIcon(
                                "packages/fx_flutterap_components/assets/svgs/Check.svg",
                                size: InitialDims.icon2,
                                color: InitialStyle.icon,
                              )
                            : FxSvgIcon(
                                "packages/fx_flutterap_components/assets/svgs/cross.svg",
                                size: InitialDims.icon2,
                                color: InitialStyle.icon,
                              ),
                        const FxHSpacer(
                          factor: 0.5,
                        ),
                        FxSvgIcon(
                          "packages/fx_flutterap_components/assets/svgs/Heart.svg",
                          size: InitialDims.icon2,
                          color: InitialStyle.icon,
                        ),
                      ],
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
