import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'fx_chart_indicator.dart';

class FxBarChartSample2 extends StatefulWidget {
  const FxBarChartSample2({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => FxBarChartSample2State();
}

class FxBarChartSample2State extends State<FxBarChartSample2> {
  final Color color1 = InitialStyle.primaryColor;
  final Color color2 = InitialStyle.specificColor;
  final Color color3 = InitialStyle.primaryDarkColor;
  final Color color4 = InitialStyle.primaryLightColor;
  final Color color5 = InitialStyle.dangerColorLight;

  static const double _barWidth = 22;
  static const _shadowOpacity = 0.2;
  static const _mainItems = <int, List<double>>{
    0: [2, 3, 2.5, 8],
    1: [-1.8, -2.7, -3, -6.5],
    2: [1.5, 2, 3.5, 6],
    3: [1.5, 1.5, 4, 6.5],
    4: [-2, -2, -5, -9],
    5: [-1.2, -1.5, -4.3, -10],
    6: [1.2, 4.8, 5, 5],
  };
  int _touchedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FxVSpacer(),
        AspectRatio(
          aspectRatio: 1.66,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              maxY: 20,
              minY: -20,
              groupsSpace: 12,
              barTouchData: BarTouchData(
                handleBuiltInTouches: false,
                touchCallback: (FlTouchEvent event, barTouchResponse) {
                  if (!event.isInterestedForInteractions ||
                      barTouchResponse == null ||
                      barTouchResponse.spot == null) {
                    setState(() {
                      _touchedIndex = -1;
                    });
                    return;
                  }
                  final rodIndex = barTouchResponse.spot!.touchedRodDataIndex;
                  if (_isShadowBar(rodIndex)) {
                    setState(() {
                      _touchedIndex = -1;
                    });
                    return;
                  }
                  setState(() {
                    _touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
                  });
                },
              ),
              titlesData: const FlTitlesData(
                show: true,
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                    reservedSize: 32,
                    // getTitlesWidget: topTitles,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                    reservedSize: 32,
                    // getTitlesWidget: bottomTitles,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                    // getTitlesWidget: leftTitles,
                    interval: 5,
                    reservedSize: 42,
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                    // getTitlesWidget: rightTitles,
                    interval: 5,
                    reservedSize: 42,
                  ),
                ),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalLine: (value) => value % 5 == 0,
                getDrawingHorizontalLine: (value) {
                  if (value == 0) {
                    return const FlLine(
                      color: Color(0xff363753),
                      strokeWidth: 3,
                    );
                  }
                  return const FlLine(
                    color: Color(0xff2a2747),
                    strokeWidth: 0.8,
                  );
                },
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: _mainItems.entries
                  .map(
                    (e) => _generateGroup(
                      e.key,
                      e.value[0],
                      e.value[1],
                      e.value[2],
                      e.value[3],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        const FxVSpacer(
          big: true,
          factor: 3,
        ),
        FxChartIndicator(
          titleList:
          [
            "${AppLocalizations.of(context)!.status}1",
            "${AppLocalizations.of(context)!.status}2",
            "${AppLocalizations.of(context)!.status}3",
            "${AppLocalizations.of(context)!.status}4",
            "${AppLocalizations.of(context)!.status}5",
           ],
          colorList: [
            color1,
            color2,
            color3,
            color4,
            color5,
          ],
        ),
      ],
    );
  }

  bool _isShadowBar(int rodIndex) => rodIndex == 1;

  BarChartGroupData _generateGroup(
    int x,
    double value1,
    double value2,
    double value3,
    double value4,
  ) {
    final isTop = value1 > 0;
    final sum = value1 + value2 + value3 + value4;
    final isTouched = _touchedIndex == x;
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      showingTooltipIndicators: isTouched ? [0] : [],
      barRods: [
        BarChartRodData(
          toY: sum,
          width: _barWidth,
          borderRadius: isTop
              ? const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                )
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
          rodStackItems: [
            BarChartRodStackItem(
              0,
              value1,
              color1,
              BorderSide(
                color: Colors.white,
                width: isTouched ? 2 : 0,
              ),
            ),
            BarChartRodStackItem(
              value1,
              value1 + value2,
              color2,
              BorderSide(
                color: Colors.white,
                width: isTouched ? 2 : 0,
              ),
            ),
            BarChartRodStackItem(
              value1 + value2,
              value1 + value2 + value3,
              color3,
              BorderSide(
                color: Colors.white,
                width: isTouched ? 2 : 0,
              ),
            ),
            BarChartRodStackItem(
              value1 + value2 + value3,
              value1 + value2 + value3 + value4,
              color5,
              BorderSide(
                color: Colors.white,
                width: isTouched ? 2 : 0,
              ),
            ),
          ],
        ),
        BarChartRodData(
          toY: -sum,
          width: _barWidth,
          color: Colors.transparent,
          borderRadius: isTop
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
          rodStackItems: [
            BarChartRodStackItem(
              0,
              -value1,
              color1
                  .withOpacity(isTouched ? _shadowOpacity * 2 : _shadowOpacity),
              const BorderSide(color: Colors.transparent),
            ),
            BarChartRodStackItem(
              -value1,
              -(value1 + value2),
              color2
                  .withOpacity(isTouched ? _shadowOpacity * 2 : _shadowOpacity),
              const BorderSide(color: Colors.transparent),
            ),
            BarChartRodStackItem(
              -(value1 + value2),
              -(value1 + value2 + value3),
              color4
                  .withOpacity(isTouched ? _shadowOpacity * 2 : _shadowOpacity),
              const BorderSide(color: Colors.transparent),
            ),
            BarChartRodStackItem(
              -(value1 + value2 + value3),
              -(value1 + value2 + value3 + value4),
              color5
                  .withOpacity(isTouched ? _shadowOpacity * 2 : _shadowOpacity),
              const BorderSide(color: Colors.transparent),
            ),
          ],
        ),
      ],
    );
  }
}
