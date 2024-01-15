import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:flutter/material.dart';
import '../../../local/packages/flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../../local/packages/flutter_datetime_picker/src/i18n_model.dart';

class FxEnglishDatePicker extends StatefulWidget {
  final String title;
  final Widget? subTitleWidget;
  final void Function(String?)? onChange;
  final DateTime? initialTime;
  final DateTime? minTime;
  final DateTime? maxTime;

  const FxEnglishDatePicker({
    Key? key,
    required this.title,
    this.subTitleWidget,
    this.onChange,
    this.initialTime,
    this.minTime,
    this.maxTime,
  }) : super(key: key);

  @override
  State<FxEnglishDatePicker> createState() => _FxEnglishDatePicker();
}

class _FxEnglishDatePicker extends State<FxEnglishDatePicker> {
  DateTime _data = DateTime(1410, 12, 31);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = widget.initialTime ?? DateTime.now();
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
                    minTime: widget.minTime ?? DateTime(1800, 1, 1),
                    maxTime: widget.maxTime ?? DateTime(2040, 12, 31),
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

                    // print(data);
                  });
                  widget.onChange!("${_data.year}/${_data.month}/${_data.day}");
                  // print('confirm $date');
                }, currentTime: _data, locale: LocaleType.en);
              }),
          const FxVSpacer(),
          FxText("${_data.year}/${_data.month}/${_data.day}"),
          const FxVSpacer(),
          widget.subTitleWidget ?? Container(),
        ],
      ),
    );
  }
}
