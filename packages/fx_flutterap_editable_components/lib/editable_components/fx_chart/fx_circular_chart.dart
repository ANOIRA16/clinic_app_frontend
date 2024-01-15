import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'fx_chart_indicator.dart';

class FxCircularChart extends StatefulWidget {
  const FxCircularChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  static Color color1 = InitialStyle.primaryDarkColor;
  static Color color2 = InitialStyle.primaryColor;
  static Color color3 = InitialStyle.specificColor;
  int _touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
      vertical:  InitialDims.space10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              width: InitialDims.space20 * 3,
              height: InitialDims.space20 * 3,
              child: AspectRatio(
                aspectRatio: 1.66,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(
                          touchCallback: (FlTouchEvent event, pieTouchResponse) {
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
                      centerSpaceRadius: 40,
                      sections: _showingSections(
                        color1,
                        color2,
                        color3,
                      )),
                ),
              ),
            ),
          ),
          const FxVSpacer(
            big: true,
            factor: 4,
          ),
          FxChartIndicator(
            titleList: [
              AppLocalizations.of(context)!.telecommuting,
              AppLocalizations.of(context)!.outsourcing,
              AppLocalizations.of(context)!.regular,
            ],
            colorList: [color1, color2, color3],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _showingSections(
    Color color1,
    Color color2,
    Color color3,
  ) {
    return List.generate(3, (i) {
      final isTouched = i == _touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: color1,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: color2,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: color3,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }
}
