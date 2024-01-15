// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_chart/fx_chart_indicator.dart';
import 'package:fx_flutterap_kernel/structure/responsive_layout.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card_header.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxGeneratedLeadsChart extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  FxGeneratedLeadsChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FxGeneratedLeadsChartState();
}

class FxGeneratedLeadsChartState extends State {
  int _touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double factor = (ResponsiveLayot.isTablet(context) ||
            ResponsiveLayot.isLargeTablet(context))
        ? 0.6
        : 1;

    Color color1 = InitialStyle.primaryColor;
    Color color2 = InitialStyle.specificColor;
    double centerSpaceRadius = InitialDims.space9 * factor;

    return FxCard(
      height: (InitialDims.space20) * 3,
      padding: EdgeInsets.symmetric(
        vertical: InitialDims.space3,
        horizontal: InitialDims.space3,
      ),
      margin: EdgeInsets.all(InitialDims.space0),
      header: FxCardHeader(
        title: AppLocalizations.of(context)!.generatedleads,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText(
                        AppLocalizations.of(context)!.monthlyreport,
                        tag: Tag.h4,
                        color: InitialStyle.secondaryTextColor,
                      )
                    ],
                  ),
                  const FxVSpacer(),
                  FxText(
                    "4,350",
                    align: TextAlign.justify,
                    tag: Tag.h2,
                    color: InitialStyle.titleTextColor,
                    isBold: true,
                    overFlowTag: true,
                    maxLine: 3,
                  ),
                  const FxVSpacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FxSvgIcon(
                        "packages/fx_flutterap_components/assets/svgs/arrowup2.svg",
                        size: InitialDims.icon2,
                        color: InitialStyle.successColorRegular,
                      ),
                      const FxHSpacer(
                        big: true,
                      ),
                      FxText(
                        "2.5%",
                        tag: Tag.h6,
                        color: InitialStyle.successColorRegular,
                        align: TextAlign.justify,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: InitialDims.space6,
                    left: InitialDims.space6,
                    top: InitialDims.space5),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: InitialDims.space12,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                              pieTouchData: PieTouchData(touchCallback:
                                  (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    _touchedIndex = -1;
                                    return;
                                  }
                                  _touchedIndex = pieTouchResponse
                                      .touchedSection!.touchedSectionIndex;
                                });
                              }),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 0,
                              centerSpaceRadius: centerSpaceRadius,
                              sections: _showingSections(color1, color2)),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FxText(
                          AppLocalizations.of(context)!.total,
                          color: InitialStyle.titleTextColor,
                          size: InitialDims.titleFontSize * factor,
                          isBold: true,
                        ),
                        FxText(
                          "148",
                          isBold: true,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          FxVSpacer(),
          FxChartIndicator(
            titleList: [
              AppLocalizations.of(context)!.loremshort,
              AppLocalizations.of(context)!.loremshort
            ],
            colorList: [
              color1,
              color2,
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _showingSections(
    Color color1,
    Color color2,
  ) {
    return List.generate(2, (i) {
      final isTouched = i == _touchedIndex;
      final radius = isTouched ? InitialDims.space7 : InitialDims.space5;
      switch (i) {
        case 0:
          return PieChartSectionData(
              color: color1, radius: radius, value: 59, title: "");
        case 1:
          return PieChartSectionData(
              color: color2, radius: radius, value: 41, title: "");
        default:
          throw Error();
      }
    });
  }
}
