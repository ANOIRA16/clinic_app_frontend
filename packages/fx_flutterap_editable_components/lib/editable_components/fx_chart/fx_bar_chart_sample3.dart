import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_chart/fx_chart_indicator.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FxBarChartSample3 extends StatefulWidget {
  const FxBarChartSample3({Key? key}) : super(key: key);

  @override
  State<FxBarChartSample3> createState() => _FxBarChartSample3State();
}

class _FxBarChartSample3State extends State<FxBarChartSample3> {
  static Color color1 = InitialStyle.primaryDarkColor;
  static Color color2 = InitialStyle.primaryColor;
  static Color color3 = InitialStyle.specificColor;
  static double betweenSpace = 0.2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        InitialDims.space5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              width: InitialDims.space20 * 5,
              height: InitialDims.space20 * 3,
              child: AspectRatio(
                aspectRatio: 1.66,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceBetween,
                    titlesData: FlTitlesData(
                      leftTitles: const AxisTitles(),
                      rightTitles: const AxisTitles(),
                      topTitles: const AxisTitles(),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: _bottomTitles,
                          reservedSize: 42,
                        ),
                      ),
                    ),
                    barTouchData: BarTouchData(enabled: false),
                    borderData: FlBorderData(show: false),
                    gridData: const FlGridData(show: false),
                    barGroups: [
                      generateGroupData(0, 2, 3, 2),
                      generateGroupData(1, 2, 5, 1.7),
                      generateGroupData(2, 1.3, 3.1, 2.8),
                      generateGroupData(3, 3.1, 4, 3.1),
                      generateGroupData(4, 0.8, 3.3, 3.4),
                      generateGroupData(5, 2, 5.6, 1.8),
                      generateGroupData(6, 1.3, 3.2, 2),
                      generateGroupData(7, 2.3, 3.2, 3),
                      generateGroupData(8, 2, 4.8, 2.5),
                      generateGroupData(9, 1.2, 3.2, 2.5),
                      generateGroupData(10, 1, 4.8, 3),
                      generateGroupData(11, 2, 4.4, 2.8),
                    ],
                    maxY: 10 + (betweenSpace * 3),
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
              "${AppLocalizations.of(context)!.status}1",
              "${AppLocalizations.of(context)!.status}2",
              "${AppLocalizations.of(context)!.status}3"],
            colorList: [color1, color2, color3],
          ),
        ],
      ),
    );
  }

  Widget _bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text =  Text(
          AppLocalizations.of(context)!.jan,
          style: style,
        );
        break;
      case 1:
        text =  Text(
          AppLocalizations.of(context)!.feb,
          style: style,
        );
        break;
      case 2:
        text =  Text(
          AppLocalizations.of(context)!.mar,
          style: style,
        );
        break;
      case 3:
        text =  Text(
          AppLocalizations.of(context)!.apri,
          style: style,
        );
        break;
      case 4:
        text =  Text(
          AppLocalizations.of(context)!.may,
          style: style,
        );
        break;
      case 5:
        text =  Text(
          AppLocalizations.of(context)!.jun,
          style: style,
        );
        break;
      case 6:
        text =  Text(
          AppLocalizations.of(context)!.july,
          style: style,
        );
        break;
      case 7:
        text =  Text(
          AppLocalizations.of(context)!.aug,
          style: style,
        );
        break;
      case 8:
        text =  Text(
          AppLocalizations.of(context)!.sep,
          style: style,
        );
        break;
      case 9:
        text =  Text(
          AppLocalizations.of(context)!.oct,
          style: style,
        );
        break;
      case 10:
        text =  Text(
          AppLocalizations.of(context)!.nov,
          style: style,
        );
        break;
      case 11:
        text =  Text(
          AppLocalizations.of(context)!.dec,
          style: style,
        );
        break;

      default:
        text = const Text(
          '',
          style: style,
        );
        break;
    }
    return Padding(padding: const EdgeInsets.only(top: 20), child: text);
  }

  BarChartGroupData generateGroupData(
    int x,
    double pilates,
    double quickWorkout,
    double cycling,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: pilates,
          color: color1,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout,
          color: color3,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace + quickWorkout + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout + betweenSpace + cycling,
          color: color2,
          width: 5,
        ),
      ],
    );
  }
}
