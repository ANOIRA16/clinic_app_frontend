import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_chart/fx_chart_indicator.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FxLinearChart extends StatefulWidget {
  const FxLinearChart({Key? key}) : super(key: key);

  @override
  State<FxLinearChart> createState() => _FxLinearChartState();
}

class _FxLinearChartState extends State<FxLinearChart> {
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    Color color2 = InitialStyle.specificColor.withOpacity(0.3);
    Color color1 = InitialStyle.primaryLightColor.withOpacity(0.7);

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
                child: LineChart(
                  showAvg ? _avgData() : _mainData(color1, color2),
                ),
              ),
            ),
          ),
          const FxVSpacer(
            big: true,
            factor: 3,
          ),
          FxChartIndicator(
            titleList: [
              AppLocalizations.of(context)!.desktop,
              AppLocalizations.of(context)!.mobile,
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

  Widget _bottomTitleWidgets(double value, TitleMeta meta) {
    double size = InitialDims.normalFontSize;
    Widget text;

    switch (value.toInt()) {
      case 2:
        text = FxText(
          AppLocalizations.of(context)!.mar,
          size: size,
        );
        break;
      case 5:
        text = FxText(AppLocalizations.of(context)!.jun, size: size);
        break;
      case 8:
        text = FxText(AppLocalizations.of(context)!.sep, size: size);
        break;
      default:
        text = FxText('', size: size);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget _leftTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return FxText(
      text,
      size: InitialDims.normalFontSize,
    );
  }

  LineChartData _mainData(Color color1, Color color2) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: InitialStyle.border,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: InitialStyle.border,
            strokeWidth: 1,
          );
        },
      ),
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
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: _bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: _leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true, border: Border.all(color: InitialStyle.border, width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          color: color1,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: color1,
          ),
        ),
        LineChartBarData(
          spots: const [
            FlSpot(0, 4),
            FlSpot(2.6, 3),
            FlSpot(4.9, 4),
            FlSpot(6.8, 3.1),
            FlSpot(8, 5),
            FlSpot(9.5, 2),
            FlSpot(11, 3),
          ],
          isCurved: true,
          color: color2,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: color2,
          ),
        ),
      ],
    );
  }

  LineChartData _avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: InitialStyle.primaryLightColor,
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: InitialStyle.primaryLightColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            // getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: _leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
          ),
        ),
      ],
    );
  }
}
