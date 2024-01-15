import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:flutter/material.dart';

import '../../../local/packages/flutter_datetime_picker/flutter_datetime_picker.dart';


class FxCupertino12HTimePicker extends StatefulWidget {
  final String title;
  final Widget? subTitleWidget;
  final void Function(String?)? onChange;
  final TimeOfDay? initialTime;

  const FxCupertino12HTimePicker({
    Key? key,
    required this.title,
    this.subTitleWidget,
    this.onChange,
    this.initialTime,
  }) : super(key: key);

  @override
  State<FxCupertino12HTimePicker> createState() => _FxCupertino12HTimePicker();
}

class _FxCupertino12HTimePicker extends State<FxCupertino12HTimePicker> {
  String _dataH = "07";
  String _dataM = "07";

  late TimeOfDay _initialTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialTime = widget.initialTime ?? TimeOfDay.now();
    _dataH = _initialTime.hour.toString();
    _dataM = _initialTime.minute.toString();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FxButton(
              onTap: () {
                DatePicker.showTime12hPicker(context, showTitleActions: true,
                    onChanged: (date) {
                  // print('change $date in time zone ' +
                  //     date.timeZoneOffset.inHours.toString());
                }, onConfirm: (date) {
                  setState(() {
                    _dataH = date.hour.toString();
                    _dataM = date.minute.toString();
                    // dataM=date.isAfter(DateTime(12,00,00));
                  });
                  widget.onChange!("$_dataH:$_dataM");
                  // print('confirm $date');
                }, currentTime: DateTime(1,1,_initialTime.hour,_initialTime.minute,0));
              },
              text: widget.title),
          const FxVSpacer(),
          FxText("$_dataH:$_dataM"),
          const FxVSpacer(),
          widget.subTitleWidget ?? Container(),
        ],
      ),
    );
  }
}
