import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'fx_chart_indicator.dart';



class FxRadarChartSample1 extends StatefulWidget {
  const FxRadarChartSample1({
    Key? key,
  }) : super(key: key);

  @override
  State<FxRadarChartSample1> createState() => _FxRadarChartSample1State();
}

class _FxRadarChartSample1State extends State<FxRadarChartSample1> {
   Color color1 = InitialStyle.successColorLight;
   Color color2 = InitialStyle.primaryDarkColor;
   Color color3 = InitialStyle.specificColor;
   Color color4 = InitialStyle.primaryLightColor;
   Color color5 = InitialStyle.primaryColor;

  int _selectedDataSetIndex = -1;



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 2,
          child: RadarChart(
            RadarChartData(
              radarTouchData: RadarTouchData(
                touchCallback: (FlTouchEvent event, response) {
                  if (!event.isInterestedForInteractions) {
                    setState(() {
                      _selectedDataSetIndex = -1;
                    });
                    return;
                  }
                  setState(() {
                    _selectedDataSetIndex =
                        response?.touchedSpot?.touchedDataSetIndex ??
                            -1;
                  });
                },
              ),
              dataSets: _showingDataSets(),
              radarBackgroundColor: Colors.transparent,
              borderData: FlBorderData(show: false),
              radarBorderData:
              const BorderSide(color: Colors.transparent),
              titlePositionPercentageOffset: 0.2,
              titleTextStyle:
              TextStyle(color: InitialStyle.titleTextColor,
                  fontSize: InitialDims.normalFontSize),

              tickCount: 1,
              ticksTextStyle: const TextStyle(
                  color: Colors.transparent, fontSize: 10),
              tickBorderData:
              const BorderSide(color: Colors.transparent),
              gridBorderData:
              BorderSide(color: InitialStyle.border, width: 2),
            ),
            swapAnimationDuration: const Duration(milliseconds: 400),
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
            "${AppLocalizations.of(context)!.status}3",
            "${AppLocalizations.of(context)!.status}4",
            "${AppLocalizations.of(context)!.status}5",],
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

  List<RadarDataSet> _showingDataSets() {
    return _rawDataSets().asMap().entries.map((entry) {
      final index = entry.key;
      final rawDataSet = entry.value;

      final isSelected = index == _selectedDataSetIndex
          ? true
          : _selectedDataSetIndex == -1
              ? true
              : false;

      return RadarDataSet(
        fillColor: isSelected
            ? rawDataSet.color.withOpacity(0.2)
            : rawDataSet.color.withOpacity(0.05),
        borderColor:
            isSelected ? rawDataSet.color : rawDataSet.color.withOpacity(0.25),
        entryRadius: isSelected ? 3 : 2,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: isSelected ? 2.3 : 2,
      );
    }).toList();
  }

  List<RawDataSet> _rawDataSets() {
    return [
      RawDataSet(
        title: 'Status1',
        color: color1,
        values: [
          300,
          50,
          250,
        ],
      ),
      RawDataSet(
        title: 'Status2',
        color: color2,
        values: [
          250,
          100,
          200,
        ],
      ),
      RawDataSet(
        title: 'Status3',
        color: color3,
        values: [
          200,
          150,
          50,
        ],
      ),
      RawDataSet(
        title: 'Status4',
        color: color4,
        values: [
          150,
          200,
          150,
        ],
      ),
      RawDataSet(
        title: 'Status5',
        color: color5,
        values: [
          100,
          250,
          100,
        ],
      ),
    ];
  }
}

class RawDataSet {
  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });

  final String title;
  final Color color;
  final List<double> values;
}
