import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';

import '../../fx_image/fx_svg_icon.dart';
import '../../fx_text/fx_text.dart';

class FxDropDown extends StatefulWidget {
  final String value;
  final String initialTitle;
  final String idName;
  final String valueName;
  final Widget? subTitleWidget;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final List list;
  final Function(String id)? onChanged;
  final TextEditingController? controller;

  final Widget? buttonWidget;
  final Offset? menuOffset;
  final BoxDecoration? dropdownDecoration;
  final double? dropdownWidth;
  final double? dropdownItemsHeight;
  final EdgeInsetsGeometry? buttonPadding;
  final EdgeInsetsGeometry? buttonMargin;

  const FxDropDown(
      {Key? key,
      this.buttonWidget,
      this.menuOffset,
      this.dropdownDecoration,
      this.dropdownWidth,
      this.dropdownItemsHeight,
      this.buttonPadding,
      this.buttonMargin,
      this.value = "",
      required this.list,
      this.onChanged,
      this.controller,
      this.idName = "_id",
      this.valueName = "title",
      this.subTitleWidget,
      this.backgroundColor,
      this.textColor,
      this.iconColor,
      this.initialTitle = ":انتخاب کنید"})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FxDropDownState();
  }
}

class _FxDropDownState extends State<FxDropDown> {
  String _value = "";
  List _list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _value = widget.value;
    _list = widget.list;

    _list.insert(0, {widget.idName: "", widget.valueName: widget.initialTitle});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            // key: dropdownKey,
            customButton: widget.buttonWidget ??
                Container(
                  padding: widget.buttonPadding ??
                      EdgeInsets.symmetric(
                        vertical: InitialDims.space2,
                        horizontal: InitialDims.space2,
                      ),
                  margin:widget.buttonMargin ?? EdgeInsets.symmetric(
                    horizontal: InitialDims.space2,
                  ),
                  decoration: BoxDecoration(
                      color:widget.backgroundColor?? InitialStyle.buttonColor,
                      borderRadius: BorderRadius.all(
                          Radius.circular(InitialDims.border2))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FxText(
                        _list[_findIndexOfValue(_list, _value)]
                        [widget.valueName],
                        color:widget.textColor??
                            InitialStyle.onPrimaryColor,
                        size: InitialDims.subtitleFontSize,
                        isBold: true,
                      ),
                      FxSvgIcon(
                        "packages/fx_flutterap_components/assets/svgs/down.svg",
                        color:widget.iconColor??widget.textColor?? InitialStyle.onPrimaryColor,
                        size: InitialDims.icon2,
                      ),

                    ],
                  ),
                ),
            items: _list.map((model) {
              return DropdownMenuItem(
                value: model[widget.idName].toString(),
                child: FxText(
                  model[widget.valueName],
                  color: InitialStyle.textColor,
                  size: InitialDims.subtitleFontSize,
                  isBold: true,
                ),
              );
            }).toList(),
            value: _value,
            onChanged: (value) {
              setState(() {
                if (value != "") {
                  _value = value.toString();

                  widget.onChanged!(value.toString());
                  widget.controller == null
                      ? null
                      : widget.controller!.text = value!;
                }
              });
            },
            itemHeight:
                widget.dropdownItemsHeight ?? (InitialDims.space10) ,
            // buttonWidth: 300,
            barrierDismissible: true,
            // alignment: Alignment.centerRight,
            // itemPadding: const EdgeInsets.only(left: 16, right: 16),
            dropdownWidth: widget.dropdownWidth ,
            // dropdownPadding: EdgeInsets.symmetric(vertical: 6),
            dropdownDecoration: widget.dropdownDecoration ??
                BoxDecoration(
                    color: InitialStyle.cardColor,
                    borderRadius: BorderRadius.all(
                        Radius.circular(InitialDims.border2))),

            offset: widget.menuOffset ?? const Offset(0, 0),
          ),
        ),
        const FxVSpacer(),
        widget.subTitleWidget ?? Container()
      ],
    );
  }

  @override
  void didUpdateWidget(covariant FxDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);

    _list = widget.list;

    if (_list.length == oldWidget.list.length - 1) {
      _list.insert(
          0, {widget.idName: "", widget.valueName: widget.initialTitle});
    }
    _value = widget.value;
  }

  int _findIndexOfValue(List list, String value) {
    int i0 = 0;
    for (int i = 0; i < list.length; i++) {
      if (list[i][widget.idName] == value) {
        i0 = i;
      }
    }
    return i0;
  }
}
