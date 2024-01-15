import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxScatterChartSample extends StatefulWidget {
  const FxScatterChartSample({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FxScatterChartSampleState();
}

class _FxScatterChartSampleState extends State {
  final Color color1 = InitialStyle.secondaryColor;

  final List<int> _selectedSpots = [];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: ScatterChart(
        ScatterChartData(
          scatterSpots: [
            ScatterSpot(
              4,
              4,
              color:
              _selectedSpots.contains(0) ? Colors.green : color1,
            ),
            ScatterSpot(
              2,
              5,
              color:
              _selectedSpots.contains(1) ? Colors.yellow : color1,
              radius: 12,
            ),
            ScatterSpot(
              4,
              5,
              color: _selectedSpots.contains(2)
                  ? Colors.purpleAccent
                  : color1,
              radius: 8,
            ),
            ScatterSpot(
              8,
              6,
              color:
              _selectedSpots.contains(3) ? Colors.orange : color1,
              radius: 20,
            ),
            ScatterSpot(
              5,
              7,
              color:
              _selectedSpots.contains(4) ? Colors.brown : color1,
              radius: 14,
            ),
            ScatterSpot(
              7,
              2,
              color: _selectedSpots.contains(5)
                  ? Colors.lightGreenAccent
                  : color1,
              radius: 18,
            ),
            ScatterSpot(
              3,
              2,
              color: _selectedSpots.contains(6) ? Colors.red : color1,
              radius: 36,
            ),
            ScatterSpot(
              2,
              8,
              color: _selectedSpots.contains(7)
                  ? Colors.tealAccent
                  : color1,
              radius: 22,
            ),
          ],
          minX: 0,
          maxX: 10,
          minY: 0,
          maxY: 10,
          borderData: FlBorderData(
            show: false,
          ),
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            checkToShowHorizontalLine: (value) => true,
            getDrawingHorizontalLine: (value) =>
                FlLine(color: InitialStyle.textColor.withOpacity(0.1)),
            drawVerticalLine: true,
            checkToShowVerticalLine: (value) => true,
            getDrawingVerticalLine: (value) =>
                FlLine(color: InitialStyle.textColor.withOpacity(0.1)),
          ),
          titlesData: const FlTitlesData(
            show: false,
          ),
          showingTooltipIndicators: _selectedSpots,
          scatterTouchData: ScatterTouchData(
            enabled: true,
            handleBuiltInTouches: false,
            mouseCursorResolver: (FlTouchEvent touchEvent,
                ScatterTouchResponse? response) {
              return response == null || response.touchedSpot == null
                  ? MouseCursor.defer
                  : SystemMouseCursors.click;
            },
            touchTooltipData: ScatterTouchTooltipData(
              tooltipBgColor: Colors.black,
              getTooltipItems: (ScatterSpot touchedBarSpot) {
                return ScatterTooltipItem(
                  'X: ',
                  textStyle: TextStyle(
                    height: 1.2,
                    color: Colors.grey[100],
                    fontStyle: FontStyle.italic,
                  ),
                  bottomMargin: 10,
                  children: [
                    TextSpan(
                      text: '${touchedBarSpot.x.toInt()} \n',
                      style: const TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Y: ',
                      style: TextStyle(
                        height: 1.2,
                        color: Colors.grey[100],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    TextSpan(
                      text: touchedBarSpot.y.toInt().toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
            touchCallback: (FlTouchEvent event,
                ScatterTouchResponse? touchResponse) {
              if (touchResponse == null ||
                  touchResponse.touchedSpot == null) {
                return;
              }
              if (event is FlTapUpEvent) {
                final sectionIndex = touchResponse.touchedSpot!.spotIndex;
                setState(() {
                  if (_selectedSpots.contains(sectionIndex)) {
                    _selectedSpots.remove(sectionIndex);
                  } else {
                    _selectedSpots.add(sectionIndex);
                  }
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
