import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxRadioButtonGroup extends StatefulWidget {
  final List<String> titleList;
  final Widget? subTitleWidget;
  final Axis? axis;
  final TextEditingController controller;
  final void Function(TextEditingController?)? onChanged;
  final bool? isScrollable;

  const FxRadioButtonGroup(
      {Key? key,
      required this.titleList,
      this.onChanged,
      this.subTitleWidget,
      this.axis,
      this.isScrollable,
      required this.controller})
      : super(key: key);

  @override
  State<FxRadioButtonGroup> createState() => _EsRadioButton();
}

class _EsRadioButton extends State<FxRadioButtonGroup> {
  String? _character;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isScrollable ?? true
              ? Container(
                  height: InitialDims.space25,
                  padding: EdgeInsets.symmetric(vertical: InitialDims.space1),
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
                padding: EdgeInsets.symmetric(horizontal: InitialDims.border2),
                child: Row(
                  children: [
                    _radioWidget(index),
                    FxText(
                      widget.titleList[index],
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget _radioWidget(int index) {
    return SizedBox(
      width: InitialDims.space7,
      height: InitialDims.space7,
      child: Radio(
        activeColor: InitialStyle.textColor,
        fillColor: MaterialStateProperty.all(
          InitialStyle.textColor,
        ),
        value: widget.titleList[index],
        groupValue: _character,
        onChanged: (value) {
          setState(() {
            _character = value.toString();
            widget.controller.text = value.toString();
          });
          widget.onChanged!(widget.controller);
        },
      ),
    );
  }
}
