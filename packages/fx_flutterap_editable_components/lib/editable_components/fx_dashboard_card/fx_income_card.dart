import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_item_indicator_icon.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxIncomeCard extends StatelessWidget {
  final List<String>? descriptionList;
  final String? memberBenefitsNum;
  final String? paymentsNum;
  final String? logisticNum;

  const FxIncomeCard({
    Key? key,
    this.descriptionList,
    this.memberBenefitsNum,
    this.paymentsNum,
    this.logisticNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> titleList = [
      AppLocalizations.of(context)!.memberbenefits,
      AppLocalizations.of(context)!.payments,
      AppLocalizations.of(context)!.logistics,
    ];
    List<String> descriptionList0 = descriptionList ??
        List.generate(
          titleList.length,
          (index) => AppLocalizations.of(context)!.loremshort,
        );
    List<String> numberList0 = [
      memberBenefitsNum ?? "313",
      paymentsNum ?? "777",
      logisticNum ?? "114",
    ];

    List<String> iconList0 = [
      "packages/fx_flutterap_components/assets/svgs/share.svg",
      "packages/fx_flutterap_components/assets/svgs/dollarsquare.svg",
      "packages/fx_flutterap_components/assets/svgs/truckfast.svg",
    ];

    return SizedBox(
      height: (InitialDims.space22) * 3,
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: InitialDims.space1,
            vertical: InitialDims.space1,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ...List.generate(
                    titleList.length,
                    (index) => _incometInfo(index, titleList, descriptionList0,
                        numberList0, iconList0, context))
              ],
            ),
          )),
    );
  }

  Widget _incometInfo(
      int index,
      List<String> widgetTitleList,
      List<String> widgetDescriptionList,
      List<String> widgetNumbrerList,
      List<String> iconPathList,
      BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: InitialDims.space2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: InitialDims.space2,
        vertical: InitialDims.space2,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: InitialStyle.border),
          borderRadius: BorderRadius.all(Radius.circular(InitialDims.border3))),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxItemIndicatorIcon(
            iconPath: iconPathList[index],
          ),
          const FxHSpacer(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FxText(
                      widgetTitleList[index],
                      tag:Tag.h4,
                      color: InitialStyle.titleTextColor,
                      isBold: true,
                    ),
                    FxText(
                      widgetNumbrerList[index] +
                          AppLocalizations.of(context)!.currencyunit,
                      isBold: true,
                      tag:Tag.h4,
                      color: InitialStyle.titleTextColor,
                      align: TextAlign.start,
                    ),
                  ],
                ),
                const FxVSpacer(
                  factor: 0.5,
                ),
                FxText(
                  widgetDescriptionList[index],
                  color: InitialStyle.textColor,
                  tag:Tag.h4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
