import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';

import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:flutter/material.dart';
import '../../../local/packages/flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../../local/packages/flutter_datetime_picker/src/i18n_model.dart';

class FxJalaliDatePicker extends StatefulWidget {
  final String title;
  final Widget? subTitleWidget;
  final void Function(String?)? onChange;
  final DateTime? initialTime;
  final DateTime? minTime;
  final DateTime? maxTime;

  const FxJalaliDatePicker({
    Key? key,
    required this.title,
    this.subTitleWidget,
    this.onChange,
    this.initialTime,
    this.minTime,
    this.maxTime,
  }) : super(key: key);

  @override
  State<FxJalaliDatePicker> createState() => _FxJalaliDatePickerState();
}

class _FxJalaliDatePickerState extends State<FxJalaliDatePicker> {
  DateTime _data = DateTime(1410, 12, 31);
  int _datamonth = 9;
  int _n = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = widget.initialTime ?? DateTime.now();
    _datamonth = _data.month.abs();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        children: <Widget>[
          FxButton(
              text: widget.title,
              onTap: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: widget.minTime ?? DateTime(1350, 1, 1),
                    maxTime: widget.maxTime ?? DateTime(1410, 12, 1),
                    // theme: DatePickerTheme(
                    //     headerColor: Colors.grey,
                    //     backgroundColor: Colors.white,
                    //     itemStyle: TextStyle(
                    //         color: Colors.black,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 18),
                    //     doneStyle:
                    //         TextStyle(color: Colors.white, fontSize: 16)),
                    onChanged: (date) {}, onConfirm: (date) {
                  setState(() {
                    _data = date.toLocal();
                    _n = (date.month >= 4) ? -3 : 8;
                    _datamonth = (date.month + _n);

                    // print(data);
                  });
                  // print('confirm $date');
                  widget.onChange!("${_data.year}/$_datamonth/${_data.day}");
                }, currentTime: _data, locale: LocaleType.fa);
              }),
          const FxVSpacer(),
          FxText("${_data.year}/$_datamonth/${_data.day}"),
          const FxVSpacer(),
          widget.subTitleWidget ?? Container(),
        ],
      ),
    );
  }
}
