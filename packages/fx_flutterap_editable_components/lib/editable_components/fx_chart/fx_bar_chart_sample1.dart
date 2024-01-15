import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'fx_chart_indicator.dart';

class FxBarChartSample1 extends StatefulWidget {
  const FxBarChartSample1({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => FxBarChartSample1State();
}

class FxBarChartSample1State extends State<FxBarChartSample1> {

  final Color color1 = InitialStyle.primaryColor;
  final Color color2 = InitialStyle.specificColor;
  final Color color3 = InitialStyle.primaryDarkColor;


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
              barTouchData: BarTouchData(
                enabled: false,
              ),
              titlesData: const FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                    reservedSize: 40,
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalLine: (value) => value % 10 == 0,
                getDrawingHorizontalLine: (value) => const FlLine(
                  color: Color(0xffe7e8ec),
                  strokeWidth: 1,
                ),
                drawVerticalLine: false,
              ),
              borderData: FlBorderData(
                show: false,
              ),
              groupsSpace: 4,
              barGroups: _getData(),
            ),
          ),
        ),
        const FxVSpacer(
          big: true,
          factor: 3,
        ),
        FxChartIndicator(
          titleList:  ["${AppLocalizations.of(context)!.status}1",
            '${AppLocalizations.of(context)!.status}2',
            '${AppLocalizations.of(context)!.status}3'],
          colorList: [
            color1,
            color2,
            color3,
          ],
        ),
      ],
    );
  }

  List<BarChartGroupData> _getData() {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: 17000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 2000000000, color1),
              BarChartRodStackItem(2000000000, 12000000000, color2),
              BarChartRodStackItem(12000000000, 17000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 24000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 13000000000, color1),
              BarChartRodStackItem(13000000000, 14000000000, color2),
              BarChartRodStackItem(14000000000, 24000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 23000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000.5, color1),
              BarChartRodStackItem(6000000000.5, 18000000000, color2),
              BarChartRodStackItem(18000000000, 23000000000.5, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 29000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, color1),
              BarChartRodStackItem(9000000000, 15000000000, color2),
              BarChartRodStackItem(15000000000, 29000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 32000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 2000000000.5, color1),
              BarChartRodStackItem(2000000000.5, 17000000000.5, color2),
              BarChartRodStackItem(17000000000.5, 32000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: 31000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 11000000000, color1),
              BarChartRodStackItem(11000000000, 18000000000, color2),
              BarChartRodStackItem(18000000000, 31000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 35000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 14000000000, color1),
              BarChartRodStackItem(14000000000, 27000000000, color2),
              BarChartRodStackItem(27000000000, 35000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 31000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 8000000000, color1),
              BarChartRodStackItem(8000000000, 24000000000, color2),
              BarChartRodStackItem(24000000000, 31000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 15000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000.5, color1),
              BarChartRodStackItem(6000000000.5, 12000000000.5, color2),
              BarChartRodStackItem(12000000000.5, 15000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 17000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, color1),
              BarChartRodStackItem(9000000000, 15000000000, color2),
              BarChartRodStackItem(15000000000, 17000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: 34000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000, color1),
              BarChartRodStackItem(6000000000, 23000000000, color2),
              BarChartRodStackItem(23000000000, 34000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 32000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 7000000000, color1),
              BarChartRodStackItem(7000000000, 24000000000, color2),
              BarChartRodStackItem(24000000000, 32000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 14000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 1000000000.5, color1),
              BarChartRodStackItem(1000000000.5, 12000000000, color2),
              BarChartRodStackItem(12000000000, 14000000000.5, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 20000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 4000000000, color1),
              BarChartRodStackItem(4000000000, 15000000000, color2),
              BarChartRodStackItem(15000000000, 20000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 24000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 4000000000, color1),
              BarChartRodStackItem(4000000000, 15000000000, color2),
              BarChartRodStackItem(15000000000, 24000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: 14000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 1000000000.5, color1),
              BarChartRodStackItem(1000000000.5, 12000000000, color2),
              BarChartRodStackItem(12000000000, 14000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 27000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 7000000000, color1),
              BarChartRodStackItem(7000000000, 25000000000, color2),
              BarChartRodStackItem(25000000000, 27000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 29000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000, color1),
              BarChartRodStackItem(6000000000, 23000000000, color2),
              BarChartRodStackItem(23000000000, 29000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 16000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, color1),
              BarChartRodStackItem(9000000000, 15000000000, color2),
              BarChartRodStackItem(15000000000, 16000000000.5, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 15000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 7000000000, color1),
              BarChartRodStackItem(7000000000, 12000000000.5, color2),
              BarChartRodStackItem(12000000000.5, 15000000000, color3),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
    ];
  }
}
