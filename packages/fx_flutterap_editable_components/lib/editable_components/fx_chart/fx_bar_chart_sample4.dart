import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_chart/fx_chart_indicator.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FxBarChartSample4 extends StatefulWidget {
  const FxBarChartSample4({Key? key}) : super(key: key);

  @override
  State<FxBarChartSample4> createState() => _FxBarChartSample4State();
}

class _FxBarChartSample4State extends State<FxBarChartSample4> {
  final Color color1 = InitialStyle.primaryColor;
  final Color color2 = InitialStyle.specificColor;
  final double _width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int _touchedGroupIndex = -1;

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
    return Container(
      padding: EdgeInsets.all(
        InitialDims.space5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.66,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: InitialDims.space2,
                  right: InitialDims.space2,
                  top: InitialDims.space5,
                  bottom: InitialDims.space5,
                ),
                child: BarChart(
                  BarChartData(
                    maxY: 20,
                    barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.grey,
                          getTooltipItem: (a, b, c, d) => null,
                        ),
                        touchCallback: (FlTouchEvent event, response) {
                          if (response == null || response.spot == null) {
                            setState(() {
                              _touchedGroupIndex = -1;
                              showingBarGroups = List.of(rawBarGroups);
                            });
                            return;
                          }

                          _touchedGroupIndex =
                              response.spot!.touchedBarGroupIndex;

                          setState(() {
                            if (!event.isInterestedForInteractions) {
                              _touchedGroupIndex = -1;
                              showingBarGroups = List.of(rawBarGroups);
                              return;
                            }
                            showingBarGroups = List.of(rawBarGroups);
                            if (_touchedGroupIndex != -1) {
                              var sum = 0.0;
                              for (var rod
                                  in showingBarGroups[_touchedGroupIndex]
                                      .barRods) {
                                sum += rod.toY;
                              }
                              final avg = sum /
                                  showingBarGroups[_touchedGroupIndex]
                                      .barRods
                                      .length;

                              showingBarGroups[_touchedGroupIndex] =
                                  showingBarGroups[_touchedGroupIndex].copyWith(
                                barRods: showingBarGroups[_touchedGroupIndex]
                                    .barRods
                                    .map((rod) {
                                  return rod.copyWith(toY: avg);
                                }).toList(),
                              );
                            }
                          });
                        }),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
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
                          showTitles: true,
                          reservedSize: 28,
                          interval: 1,
                          getTitlesWidget: _leftTitles,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: showingBarGroups,
                    gridData: const FlGridData(show: false),
                  ),
                ),
              ),
            ),
          ),
          const FxVSpacer(
            big: true,
            factor: 3,
          ),
          FxChartIndicator(
            titleList:  [
              AppLocalizations.of(context)!.success,
              AppLocalizations.of(context)!.primary,
              ],
            colorList: [
              color2,
              color1,
            ],
          ),
        ],
      ),
    );
  }

  Widget _leftTitles(double value, TitleMeta meta) {
    String text;
    if (value == 0) {
      text = '1K';
    } else if (value == 10) {
      text = '5K';
    } else if (value == 19) {
      text = '10K';
    } else {
      return Container();
    }
    return FxText(
      text,
      size: InitialDims.normalFontSize,
    );
  }

  Widget _bottomTitles(double value, TitleMeta meta) {
    double size = InitialDims.subtitleFontSize;
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = FxText(AppLocalizations.of(context)!.jan, size: size);
        break;
      case 1:
        text = FxText(AppLocalizations.of(context)!.feb, size: size);
        break;
      case 2:
        text = FxText(AppLocalizations.of(context)!.mar, size: size);
        break;
      case 3:
        text = FxText(AppLocalizations.of(context)!.apri, size: size);
        break;
      case 4:
        text = FxText(AppLocalizations.of(context)!.may, size: size);
        break;
      case 5:
        text = FxText(AppLocalizations.of(context)!.jun, size: size);
        break;
      case 6:
        text = FxText(AppLocalizations.of(context)!.july, size: size);
        break;
      default:
        text = FxText('', size: size);
        break;
    }
    return Padding(padding: const EdgeInsets.only(top: 20), child: text);
  }

  BarChartGroupData _makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
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
