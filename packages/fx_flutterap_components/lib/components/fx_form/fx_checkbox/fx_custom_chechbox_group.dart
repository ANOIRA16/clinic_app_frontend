import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import 'fx_custom_check_box.dart';

class FxCustomCheckboxGroup extends StatefulWidget {
  final List<String> titleList;
  final Widget? subTitleWidget;
  final Axis? axis;
  final List<bool> valueList;
  final void Function(List<TextEditingController>?)? onChanged;
  final TextEditingController? controller;
  final List<TextEditingController> controllerList;
  final bool? isScrollable;

  const FxCustomCheckboxGroup(
      {Key? key,
      required this.titleList,
      this.axis,
      this.subTitleWidget,
      this.onChanged,
      required this.controllerList,
      this.controller,
      this.isScrollable,
      required this.valueList})
      : super(key: key);

  @override
  State<FxCustomCheckboxGroup> createState() => _EsRadioButton();
}



class _EsRadioButton extends State<FxCustomCheckboxGroup> {
  List<bool> _valueList = [];
  final List<String> _selectedList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _valueList = widget.valueList;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isScrollable ?? true
              ? Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(
                      vertical: InitialDims.border2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(InitialDims.border2)),
                      border: Border.all(color: InitialStyle.borderInput)),
                  child: SingleChildScrollView(
                    child: Column(children: _content()),
                  ),
                )
              : Wrap(
                  direction: widget.axis ?? Axis.horizontal,
                  children: _content()),
          widget.subTitleWidget ?? Container()
        ],
      ),
    );
  }

  List<Widget> _content() {
    return List.generate(
        widget.titleList.length,
        (index) => IntrinsicWidth(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: InitialDims.border2),
                child:  _checkboxWidget(index, _valueList[index],
                  FxText(
                    widget.titleList[index],
                  ),),
              ),
            ));
  }

  Widget _checkboxWidget(int index, bool value,Widget title) {
    return FxCustomCheckBox(
      value: value,
      titleWidget: title,
      onChanged: (bool value) {
        setState(() {
          _valueList[index] = value;

          if (_valueList[index] == false) {
            _selectedList.remove(widget.titleList[index]);
          }
          if (_valueList[index] == true) {
            _selectedList.add(widget.titleList[index]);
            widget.controllerList[index].text = widget.titleList[index];
          }

          widget.controller!.text = _selectedList.join(",").toString();
          widget.onChanged!(widget.controllerList);
        });
      },
    );
  }
}
