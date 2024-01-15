import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxProfitCard extends StatefulWidget {
  const FxProfitCard({Key? key}) : super(key: key);

  @override
  State<FxProfitCard> createState() => _FxProfitCardState();
}

class _FxProfitCardState extends State<FxProfitCard> {
  final Color color1 = InitialStyle.primaryColor;
  final Color color2 = InitialStyle.specificColor;
  final double _width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    super.initState();
    final barGroup1 = _makeGroupData(0, 5, 12);
    final barGroup2 = _makeGroupData(1, 16, 12);
    final barGroup3 = _makeGroupData(2, 18, 5);
    final barGroup4 = _makeGroupData(3, 20, 16);
    final barGroup5 = _makeGroupData(4, 17, 6);
    final barGroup6 = _makeGroupData(5, 19, 1.5);
    final barGroup7 = _makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    List<LineChartBarData> lineChartBarData = [
      LineChartBarData(
        barWidth: 0.7,
        isStrokeCapRound: true,
        spots: [
          const FlSpot(1, 1),
          const FlSpot(2, 2),
          const FlSpot(3, 3),
          const FlSpot(4, 6),
          const FlSpot(5, 8),
          const FlSpot(7, 9),
          const FlSpot(8, 10),
          const FlSpot(9, 11),
          const FlSpot(10, 12),
          const FlSpot(11, 13),
        ],
        color: color2,
        dotData: const FlDotData(
          show: false,
        ),
      )
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: InitialDims.space1,
        vertical: InitialDims.space1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          FxText(AppLocalizations.of(context)!.lastmonth,
            tag:Tag.h5,

          ),
          const FxVSpacer(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: InitialDims.space22*2,
                child: AspectRatio(
                  aspectRatio: 0.75,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: true,
                        horizontalInterval: 1,
                        verticalInterval: 1,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: InitialStyle.border,
                            strokeWidth: 0,
                          );
                        },
                        getDrawingVerticalLine: (value) {
                          return FlLine(
                            color: InitialStyle.border,
                            dashArray: [5,5],
                            strokeWidth: 1,
                          );
                        },
                      ),
                      titlesData: const FlTitlesData(
                        show: false,
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      minX: 0,
                      minY: 1,
                      maxX: 12,
                      maxY: 16,
                      lineBarsData: lineChartBarData,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const FxVSpacer(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxText(
                "624k" ,
                isBold: true,
                tag:Tag.h2,
                color: InitialStyle.titleTextColor,
                align: TextAlign.start,
              ),
              const FxVSpacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxSvgIcon(
                    "packages/fx_flutterap_components/assets/svgs/arrowup2.svg",
                    size: InitialDims.icon2,
                    color: InitialStyle.successColorRegular,
                  ),


                  FxText("25%",tag:Tag.h6,
                    size: InitialDims.smallFontSize,
                    color:  InitialStyle.successColorRegular,
                    align: TextAlign.justify,
                  ),
                ],
              ),


            ],
          ),

        ],
      ),
    );
  }

  BarChartGroupData _makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 2, x: x, barRods: [
      BarChartRodData(
        toY: y1,
        color: color1,
        width: _width,
      ),
      BarChartRodData(
        toY: y2,
        color: color2,
        width: _width,
      ),
    ]);
  }
}
