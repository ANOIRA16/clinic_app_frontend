
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/cupertino.dart';

import '../../fx_text/fx_text.dart';

class FxSlider extends StatefulWidget {
  final double? initialValue;
  final Widget? subTitleWidget;
  final void Function(double?)? onChanged;
  final void Function(double?)? onChangeStart;
  final void Function(double?)? onChangeEnd;
  final double? max;
  final double? min;
  final int? divisions;
  final Color? activeColor;
  final Color? thumbColor;
  final bool? disabled;

  const FxSlider({
    Key? key,
    this.initialValue,
    this.subTitleWidget,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.max,
    this.min,
    this.divisions,
    this.activeColor,
    this.thumbColor,
    this.disabled,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxSliderState();
  }
}

class _FxSliderState extends State<FxSlider> {
  late double _value;

  @override
  void initState() {
    _value = widget.initialValue ?? 10;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoSlider(
            activeColor: widget.activeColor ?? InitialStyle.textColor,
            divisions: widget.divisions,
            thumbColor: widget.thumbColor ?? InitialStyle.primaryLightColor,
            max: widget.max ?? 100,
            min: widget.min ?? 0,
            value: _value,
            onChangeEnd: widget.onChangeEnd,
            onChangeStart: widget.onChangeStart,
            onChanged: (value) {
              setState(() {
                widget.disabled ?? false ? null : _value = value;
              });

              widget.onChanged!(value);
            }),
        widget.subTitleWidget ?? FxText(_value.round().toString(),tag:Tag.h3,)
      ],
    );
  }
}
