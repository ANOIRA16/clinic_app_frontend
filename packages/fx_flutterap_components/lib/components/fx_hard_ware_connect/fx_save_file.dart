import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_alert/fx_alerts.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxSaveFile extends StatefulWidget {
  final Uint8List fileData;
  final String? saveButtonString ;
  final String? saveAlertString ;

  const FxSaveFile({Key? key, required this.fileData,
    this.saveButtonString,
    this.saveAlertString,
  }) : super(key: key);

  @override
  State<FxSaveFile> createState() => _FxSaveFileState();
}

class _FxSaveFileState extends State<FxSaveFile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.memory(widget.fileData),
        const FxVSpacer(
          factor: 5,
        ),
        FxButton(
            onTap: () {
              _saveFile(widget.fileData);
            },
            text:widget.saveButtonString?? "Save")
      ],
    );
  }

  Future<void> _saveFile(Uint8List fileData) async {
    final String fileFath = await FileSaver.instance
        .saveFile(  name: 'flutterap_saved_file.jpg',bytes:fileData,);

    if (context.mounted) {
      FxAlerts.success(context, "",
          myContent: FxText(
            "${widget. saveAlertString??"Save was successful:) in"}$fileFath",
            color: InitialStyle.successColorDark,
          ),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(InitialDims.border2)),
              border:
                  Border.all(color: InitialStyle.successColorDark, width: 2)));
    }
  }
}
