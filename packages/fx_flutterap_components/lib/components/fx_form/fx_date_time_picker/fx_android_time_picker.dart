import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

class FxAndroidTimePicker extends StatefulWidget {
  final String title;
  final Widget? subTitleWidget;
  final void Function(String?)? onChange;

  final TimeOfDay? initialTime;

  const FxAndroidTimePicker({
    Key? key,
    required this.title,
    this.subTitleWidget,
    this.onChange,
    this.initialTime,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxAndroidTimePicker();
  }
}

class _FxAndroidTimePicker extends State<FxAndroidTimePicker> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedTime = widget.initialTime ?? TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FxButton(
            onTap: () {
              _selectTime(context);
              widget.onChange!("${_selectedTime.hour}:${_selectedTime.minute}");
            },
            text: widget.title,
          ),
          const FxVSpacer(),
          FxText("${_selectedTime.hour}:${_selectedTime.minute}"),
          const FxVSpacer(),
          widget.subTitleWidget ?? Container(),
        ],
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != _selectedTime) {
      setState(() {
        _selectedTime = timeOfDay;
      });
    }
  }
}
