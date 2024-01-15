import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_form/fx_checkbox/fx_custom_check_box.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_label/fx_content_label.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxTasksList extends StatefulWidget {
  final List<bool>? valueList;
  final List<String> descriptionList;
  final List<String>? dateList;

  const FxTasksList({
    Key? key,
    this.valueList,
    required this.descriptionList,
    this.dateList,
  }) : super(key: key);

  @override
  State<FxTasksList> createState() => _FxTasksListState();
}

class _FxTasksListState extends State<FxTasksList> {
  @override
  Widget build(BuildContext context) {
    List<bool> valueList = widget.valueList ??
        List.generate(
          widget.descriptionList.length,
          (index) => false,
        );
    List<String> dateList = widget.dateList ??
        List.generate(
          widget.descriptionList.length,
          (index) => "21${AppLocalizations.of(context)!.july}| 08:20-10:30",
        );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: InitialDims.space1,
        vertical: InitialDims.space1,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FxVSpacer(
              big: true,
              factor: 3,
            ),
            ...List.generate(
                widget.descriptionList.length,
                (index) => _taskCards(index, dateList, widget.descriptionList,
                    valueList, context))
          ],
        ),
      ),
    );
  }

  Widget _taskCards(
      int index,
      List<String> widgetDateList,
      List<String> widgetDescriptionList,
      List<bool> widgetValueList,
      BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: InitialDims.space2),
      child: Column(
        children: [
          FxCustomCheckBox(
            titleWidget: Expanded(
              child: FxText(
                widgetDescriptionList[index],
                align: TextAlign.start,
                tag: Tag.h4,
                isBold: true,
                color: InitialStyle.titleTextColor,
                overFlowTag: true,
                maxLine: 1,
                decoration: widgetValueList[index]
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            value: widgetValueList[index],
            onChanged: (value) {
              setState(() {
                widgetValueList[index] = value;
              });
            },
          ),
          Row(
            children: [
              const FxHSpacer(
                factor: 3,
              ),
              FxSvgIcon(
                "packages/fx_flutterap_components/assets/svgs/CalendarCheck.svg",
                size: InitialDims.icon2,
                color: InitialStyle.icon,
              ),
              const FxHSpacer(),
              FxText(
                widgetDateList[index],
                color: InitialStyle.secondaryTextColor,
                tag: Tag.h5,
                align: TextAlign.start,
                decoration: widgetValueList[index]
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
              const FxHSpacer(),
              FxContentLabel(
                isUnique: true,
                size: InitialDims.icon5,
                color: InitialStyle.primaryLightColor,
                textColor: InitialStyle.primaryDarkColor,
                text: AppLocalizations.of(context)!.business,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
