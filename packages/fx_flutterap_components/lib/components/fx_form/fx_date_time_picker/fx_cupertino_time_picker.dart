import 'package:flutter/foundation.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:flutter/material.dart';
import '../../../local/packages/flutter_datetime_picker/flutter_datetime_picker.dart';

class FxCupertinoTimePicker extends StatefulWidget {
  final String title;
  final Widget? subTitleWidget;
  final void Function(String?)? onChange;
  final TimeOfDay? initialTime;

  const FxCupertinoTimePicker({
    Key? key,
    required this.title,
    this.subTitleWidget,
    this.onChange,
    this.initialTime,
  }) : super(key: key);

  @override
  State<FxCupertinoTimePicker> createState() => _FxCupertinoTimePicker();
}

class _FxCupertinoTimePicker extends State<FxCupertinoTimePicker> {
  String _dataH = "07";
  String _dataM = "07";
  String _dataS = "07";
  late TimeOfDay _initialTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialTime = widget.initialTime ?? TimeOfDay.now();
    _dataH = _initialTime.hour.toString();
    _dataM = _initialTime.minute.toString();
    _dataS = "00";
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        children: <Widget>[
          FxButton(
            onTap: () {
              DatePicker.showTimePicker(context, showTitleActions: true,
                  onChanged: (date) {
                if (kDebugMode) {
                  print(
                      'change $date in time zone ${date.timeZoneOffset.inHours}');
                }
              }, onConfirm: (date) {
                setState(() {
                  _dataH = date.hour.toString();
                  _dataM = date.minute.toString();
                  _dataS = date.second.toString();
                });
                widget.onChange!("$_dataH:$_dataM:$_dataS");
                // print('confirm $date');
              },
                  currentTime: DateTime(1,1,_initialTime.hour,_initialTime.minute,0)
              );
            },
            text: widget.title,
          ),
          const FxVSpacer(),
          FxText("$_dataH:$_dataM:$_dataS"),
          const FxVSpacer(),
          widget.subTitleWidget ?? Container(),
        ],
      ),
    );
  }
}
