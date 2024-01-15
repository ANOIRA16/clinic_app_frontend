import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_form/fx_checkbox/fx_custom_check_box.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class FxTodoList extends StatefulWidget {
  final List<bool>? valueList;
  final List<String> descriptionList;
  final List<String>? dateList;
  final List<List<String>>? iconList;

  const FxTodoList({
    Key? key,
    this.valueList,
    required this.descriptionList,
    this.dateList,
    this.iconList,
  }) : super(key: key);

  @override
  State<FxTodoList> createState() => _FxTodoListState();
}

class _FxTodoListState extends State<FxTodoList> {
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
          (index) => "9:40 ${AppLocalizations.of(context)!.am}",
        );

    List<List<String>> iconList = widget.iconList ??
        [
          List.generate(
              4,
              (index) =>
                  "packages/fx_flutterap_components/assets/images/avatar${index + 1}.png"),
          List.generate(
              2,
              (index) =>
                  "packages/fx_flutterap_components/assets/images/avatar${index + 1}.png"),
          List.generate(
              3,
              (index) =>
                  "packages/fx_flutterap_components/assets/images/avatar${index + 1}.png"),
          List.generate(
              3,
              (index) =>
                  "packages/fx_flutterap_components/assets/images/avatar${index + 1}.png"),

        ];

    return Container(
      height: (InitialDims.space25) * 4,
      padding: EdgeInsets.symmetric(
        horizontal: InitialDims.space1,
        vertical: InitialDims.space1,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ...List.generate(
                widget.descriptionList.length,
                (index) => _taskCards(index, dateList, iconList,
                    widget.descriptionList, valueList, context))
          ],
        ),
      ),
    );
  }

  Widget _taskCards(
      int index,
      List<String> widgetDateList,
      List<List<String>> iconList,
      List<String> widgetDescriptionList,
      List<bool> widgetValueList,
      BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: InitialDims.space2),
      child: Column(
        children: [
          FxCustomCheckBox(
            titleWidget:  Expanded(
              child: FxText(
                widgetDescriptionList[index],
                align: TextAlign.start,tag:Tag.h4,
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
              FxText(
                widgetDateList[index],
                color: InitialStyle.secondaryTextColor,
                tag:Tag.h5,
                align: TextAlign.start,
                decoration: widgetValueList[index]
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ],
          ),
          const FxVSpacer(),
          Row(
            children: [
              ...List.generate(
                iconList[index].length,
                (index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FxAvatarImage(
                      path:
                          "packages/fx_flutterap_components/assets/images/avatar${index + 1}.png",
                      size: InitialDims.icon2,
                    ),
                    const FxHSpacer(
                      factor: 0.5,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
