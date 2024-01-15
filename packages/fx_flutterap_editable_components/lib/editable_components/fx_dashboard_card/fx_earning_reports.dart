// ignore_for_file: prefer_const_constructors
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_item_indicator_icon.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxEarningReports extends StatefulWidget {
  final List<String>? descriptionList;
  final String? netProfit;
  final String? totalIncome;
  final String? totalExpenses;

  const FxEarningReports({
    Key? key,
    this.descriptionList,
    this.netProfit,
    this.totalIncome,
    this.totalExpenses,
  }) : super(key: key);

  @override
  State<FxEarningReports> createState() => _FxEarningReportsState();
}

class _FxEarningReportsState extends State<FxEarningReports> {
  final Color color1 = InitialStyle.disableColorLight;
  final Color color2 = InitialStyle.specificColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> titleList = [
      AppLocalizations.of(context)!.netprofit,
      AppLocalizations.of(context)!.totalincome,
      AppLocalizations.of(context)!.totalexpenses,
    ];
    List<String> descriptionList0 = widget.descriptionList ??
        List.generate(
          titleList.length,
          // ignore: prefer_interpolation_to_compose_strings
          (index) => "12.4k"+AppLocalizations.of(context)!.sales,
        );
    List<String> numberList0 = [
      widget.netProfit ?? "\$1,619",
      widget.totalIncome ?? "\$1,619",
      widget.totalExpenses ?? "\$1,619",
    ];

    List<String> iconList0 = [
      "packages/fx_flutterap_components/assets/svgs/share.svg",
      "packages/fx_flutterap_components/assets/svgs/dollarsquare.svg",
      "packages/fx_flutterap_components/assets/svgs/truckfast.svg",
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: InitialDims.space1,
        vertical: InitialDims.space1,
      ),
      height: (InitialDims.space25) * 4,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxText(
              AppLocalizations.of(context)!.weeklyearningsoverview,
              tag:Tag.h5,
            ),
            ...List.generate(
                titleList.length,
                    (index) => _earningInfo(index, titleList, descriptionList0,
                    numberList0, iconList0, context)),
            const FxVSpacer(
              factor: 0.5,
            ),
            AspectRatio(
              aspectRatio: 3.9,
              child: Center(
                child: BarChart(
                  BarChartData(
                    barGroups: [
                      BarChartGroupData(
                          x: 0,
                          barRods: [makeRodData(toY: 20, color: color1)]),
                      BarChartGroupData(
                          x: 1,
                          barRods: [makeRodData(toY: 40, color: color1)]),
                      BarChartGroupData(
                          x: 2,
                          barRods: [makeRodData(toY: 30, color: color2)]),
                      BarChartGroupData(
                          x: 3,
                          barRods: [makeRodData(toY: 60, color: color1)]),
                      BarChartGroupData(
                          x: 4,
                          barRods: [makeRodData(toY: 75, color: color1)]),
                      BarChartGroupData(
                          x: 5,
                          barRods: [makeRodData(toY: 35, color: color1)]),
                      BarChartGroupData(
                          x: 6,
                          barRods: [makeRodData(toY: 42, color: color1)]),
                    ],
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: _bottomTitles,
                          reservedSize: 42,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                          reservedSize: 28,
                          interval: 1,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    gridData: FlGridData(show: false),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _earningInfo(
      int index,
      List<String> widgetTitleList,
      List<String> widgetDescriptionList,
      List<String> widgetNumbrerList,
      List<String> iconPathList,
      BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: InitialDims.space2,
            vertical: InitialDims.space2,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxItemIndicatorIcon(
                iconPath: iconPathList[index],
              ),
              const FxHSpacer(factor: 0.5,),
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
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FxText(
                              widgetNumbrerList[index] ,
                              tag:Tag.h5,
                              color: InitialStyle.titleTextColor,
                              isBold: true,
                              align: TextAlign.start,
                            ),
                            const FxHSpacer(
                              factor: 0.1,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FxSvgIcon(
                                  "packages/fx_flutterap_components/assets/svgs/arrowup2.svg",
                                  size: InitialDims.icon2,
                                  color: InitialStyle.successColorRegular,
                                ),
                                FxText(
                                  "15%",
                                  tag:Tag.h6,
                                  color: InitialStyle.successColorRegular,
                                  align: TextAlign.justify,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const FxVSpacer(
                      factor: 0.5,
                    ),
                    FxText(
                      widgetDescriptionList[index],
                      tag:Tag.h5,
                      color: InitialStyle.secondaryTextColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        FxHDivider()
      ],
    );
  }

  Widget _bottomTitles(double value, TitleMeta meta) {
    Tag tag = Tag.h4;
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = FxText(AppLocalizations.of(context)!.sat, tag: tag);
        break;
      case 1:
        text = FxText(AppLocalizations.of(context)!.sun, tag: tag);
        break;
      case 2:
        text = FxText(AppLocalizations.of(context)!.mon, tag: tag);
        break;
      case 3:
        text = FxText(AppLocalizations.of(context)!.tue, tag: tag);
        break;
      case 4:
        text = FxText(AppLocalizations.of(context)!.wed, tag: tag);
        break;
      case 5:
        text = FxText(AppLocalizations.of(context)!.thu, tag: tag);
        break;
      case 6:
        text = FxText(AppLocalizations.of(context)!.fri, tag: tag);
        break;
      default:
        text = FxText('', tag: tag);
        break;
    }
    return Padding(padding: const EdgeInsets.only(top: 20), child: text);
  }

  BarChartRodData makeRodData({required double toY, required Color color}) {
    return BarChartRodData(
      toY: toY,
      color: color,
      width: InitialDims.space7,
      borderRadius: BorderRadius.circular(InitialDims.border1),
    );
  }
}
