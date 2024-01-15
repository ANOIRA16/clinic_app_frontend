import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import '../../fx_label/fx_content_label.dart';
import '../../fx_text/fx_text.dart';
import '../fx_drop_down/fx_drop_down.dart';

class FxLabelInputSepratedDropDown extends StatefulWidget {
  final List labelList;
  final ValueChanged<List<String>>? onChanged;
  final Widget? subTitleWidget;
  final String? buttonName;

  const FxLabelInputSepratedDropDown(
      {Key? key, required this.labelList,
        this.onChanged,
        this.buttonName,
        this.subTitleWidget})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxLabelInputSepratedDropDownState();
  }
}
//



class _FxLabelInputSepratedDropDownState
    extends State<FxLabelInputSepratedDropDown> {


  final String _value1 = "";
  List<String> _list = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list = _stringList(widget.labelList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicWidth(
          child: FxDropDown(
            initialTitle: widget.buttonName??"Select",
            list: widget.labelList,
            value: _value1,
            buttonPadding: EdgeInsets.symmetric(
              vertical: InitialDims.space1,
              horizontal: InitialDims.space2,
            ),
            onChanged: (value) {
              setState(() {
                // _value1 = value;
                if (!(_list.contains(
                    widget.labelList[_findIndexOfValue(widget.labelList, value)]
                        ["title"]))) {
                  _list.add(widget
                          .labelList[_findIndexOfValue(widget.labelList, value)]
                      ["title"]);
                }
              });
              widget.onChanged!(_list);
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: InitialDims.space2,
            horizontal: InitialDims.space2,
          ),
          // width: MediaQuery.of(context).size.width/3.5,
          height: (InitialDims.space10) ,
          decoration: BoxDecoration(
            border: Border.all(color: InitialStyle.borderInput),
            borderRadius:
                BorderRadius.all(Radius.circular(InitialDims.border2)),
          ),
          child: Wrap(
              spacing: InitialDims.space2,
              runSpacing: InitialDims.space2,
              children: List.generate(
                _list.length,
                (index) => IntrinsicWidth(
                  child: FxContentLabel(
                    isUnique: true,
                    size: InitialDims.icon3,
                    color: InitialStyle.buttonColor,
                    labelContent: Row(
                      children: [
                        FxText(
                          _list[index],tag:Tag.h5,
                          color: InitialStyle.onPrimaryColor,
                        ),
                        const FxHSpacer(),
                        InkWell(
                          child: Icon(
                            Icons.close,
                            size: InitialDims.icon2,
                            color: InitialStyle.onPrimaryColor,
                          ),
                          onTap: () {
                            setState(() {
                              _list.remove(_list[index]);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ),
        widget.subTitleWidget ?? Container()
      ],
    );
  }


  List<String> _stringList(list) {
    List<String> stringList = [];
    for (int i = 0; i < list.length; i++) {
      stringList.add(list[i]["title"]);
    }
    return stringList;
  }

  int _findIndexOfValue(List list, String value) {
    int i0 = 0;
    for (int i = 0; i < list.length; i++) {
      if (list[i]["_id"] == value) {
        i0 = i;
      }
    }
    return i0;
  }

}
