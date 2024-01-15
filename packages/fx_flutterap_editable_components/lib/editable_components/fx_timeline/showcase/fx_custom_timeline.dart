import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class FxCustomTimeLine extends StatelessWidget {
  final List<Widget> contentList;
  final List<Widget> indicatorList;
  final List<double>? tileLenghtList;

  const FxCustomTimeLine({
    Key? key,
    required this.contentList,
    required this.indicatorList,
    this.tileLenghtList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: InitialDims.space5),
        child: Row(
          children: [
            _timeline1(context),
          ],
        ),
      ),
    );
  }

  Widget _timeline1(BuildContext context) {
    return Flexible(
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          connectorTheme: ConnectorThemeData(
            thickness: 1.0,
            color: InitialStyle.divider,
          ),
          indicatorTheme: IndicatorThemeData(
            size: InitialDims.space5,
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: InitialDims.space2,
        ),
        builder: TimelineTileBuilder.connected(
          contentsBuilder: (_, index) {
            return contentList[index];
          },
          connectorBuilder: (_, index, __) {
            return const SolidLineConnector();
          },
          indicatorBuilder: (_, index) {
            return _indicatorFrame(indicatorList[index]);
          },
          itemExtentBuilder: (_, index) => tileLenghtList == null
              ? (InitialDims.space25)
              : tileLenghtList![index],
          itemCount: indicatorList.length,
        ),
      ),
    );
  }
  
  Widget _indicatorFrame(Widget indicator){
    
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.all(InitialDims.space1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(InitialDims.space25)),
        border: Border.all(color: InitialStyle.border)
      ),
      child: indicator,
    );
  }
}
