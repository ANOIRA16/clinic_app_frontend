import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import '../fx_spacer/fx_h_divider.dart';
import '../fx_spacer/fx_h_spacer.dart';

class FxSimpleTable extends StatefulWidget {
  final List<Widget> columnTitle;
  final List<List<Widget>> rowsContent;
  final BoxDecoration? decoration;
  final double? horizontalMargin;
  final double? tableHeight;
  final double? dataRowHeight;
  final double? headingRowHeight;
  final double? dividerThickness;
  final double? columnSpacing;
  final Color? headingColor;
  final Color? zebraColor;
  final bool? zebraMode;
  final double? verticalModeBreakPoint;



  const FxSimpleTable({
    Key? key,
    required this.columnTitle,
    required this.rowsContent,
    this.decoration,
    this.horizontalMargin,
    this.tableHeight,
    this.dataRowHeight,
    this.headingRowHeight,
    this.dividerThickness,
    this.columnSpacing,
    this.headingColor,
    this.zebraColor,
    this.zebraMode,
    this.verticalModeBreakPoint,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FxSimpleTable();
  }
}

class _FxSimpleTable extends State<FxSimpleTable> {
  double _height = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double verticalModeBreakPoint=widget.verticalModeBreakPoint??0;
    int numofRows = widget.rowsContent.length;
    double headingRowHeight =
        widget.headingRowHeight ?? InitialDims.space10;
    double dataRowHeight = widget.dataRowHeight ?? InitialDims.space7;
    _height = widget.tableHeight??(headingRowHeight + ((numofRows) * (dataRowHeight)));

    return (width > verticalModeBreakPoint)
        ?Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      height: _height+InitialDims.space3,
      decoration: widget.decoration ??
          BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(InitialDims.border3))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DataTable(
              horizontalMargin: widget.horizontalMargin,
              decoration: widget.decoration ??
                  BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(InitialDims.border3)),
                  ),
              border: TableBorder(
                  horizontalInside: BorderSide(
                      width: widget.dividerThickness ?? 1,
                      color: InitialStyle.divider)),
              dividerThickness: widget.dividerThickness ?? 1,
              headingRowHeight:
                  widget.headingRowHeight ?? (InitialDims.space11),
              // ignore: deprecated_member_use
              dataRowHeight: widget.dataRowHeight ?? InitialDims.icon5,
              headingRowColor: MaterialStateProperty.resolveWith((states) {
                return widget.headingColor ?? InitialStyle.buttonColor;
              }),
              dataRowColor: MaterialStateProperty.resolveWith((Set states) {
                if (states.contains(MaterialState.selected)) {
                  return widget.zebraColor ?? InitialStyle.primaryColor;
                }
                return null;
              }),
              columnSpacing: widget.columnSpacing ?? 0,
              columns: List.generate(
                widget.columnTitle.length,
                (index) => DataColumn(label: widget.columnTitle[index]),
              ),
              rows: List.generate(
                widget.rowsContent.length,
                (indext) => DataRow(
                  selected: widget.zebraMode ?? false
                      ? indext % 2 == 0
                          ? false
                          : true
                      : false,
                  cells: List.generate(widget.columnTitle.length,
                      (index) => DataCell(widget.rowsContent[indext][index])),
                ),
              )),
        ],
      ),
    )
        :SingleChildScrollView(
          child: Column(
      children: [
          ...List.generate(widget.rowsContent.length,
                  (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(widget.rowsContent[index].length,
                              (index2) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:MainAxisAlignment.start,
                                children: [
                                  Expanded(child: widget.columnTitle[index2]),
                                  const FxHSpacer(factor: 2,),
                                  Expanded(

                                      child: widget.rowsContent[index][index2]),
                                ],
                              ),
                              const FxVSpacer()
                            ],
                          )),

                      const FxHDivider()
                    ],

                  ))],

    ),
        );
  }
}

