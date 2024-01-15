import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import 'package:flutter/material.dart';

class FxRangeSlider extends StatefulWidget {
  final RangeValues? initialvalue;
  final Widget? subTitleWidget;
  final void Function(RangeValues)? onChanged;
  final void Function(RangeValues?)? onChangeStart;
  final void Function(RangeValues?)? onChangeEnd;
  final double? max;
  final double? min;
  final int? divisions;
  final Color? activeColor;
  final Color? inActiveColor;

  const FxRangeSlider({
    Key? key,
    this.initialvalue,
    this.subTitleWidget,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.max,
    this.min,
    this.divisions,
    this.activeColor,
    this.inActiveColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxRangeSliderState();
  }
}

class _FxRangeSliderState extends State<FxRangeSlider> {
  double _startValue = 0.0;
  double _endValue = 100.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startValue = widget.min ?? 0.0;
    _endValue = widget.max ?? 100.0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          min: widget.min ?? 0.0,
          max: widget.max ?? 100.0,
          divisions: widget.divisions,
          values: widget.initialvalue ?? RangeValues(_startValue, _endValue),
          onChangeStart: widget.onChangeStart,
          onChangeEnd: widget.onChangeEnd,
          activeColor: widget.activeColor ?? InitialStyle.textColor,
          inactiveColor: widget.inActiveColor ?? InitialStyle.disableColorDark,
          onChanged: (values) {
            setState(() {
              _startValue = values.start;
              _endValue = values.end;
            });
            widget.onChanged!(values);
          },
        ),
        widget.subTitleWidget ??
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FxText("Start Value:${_startValue.round()}"),
                FxText("End Value:${_endValue.round()}"),
              ],
            )
      ],
    );
  }
}
