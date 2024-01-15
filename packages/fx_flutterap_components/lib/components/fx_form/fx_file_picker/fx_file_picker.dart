import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import '../fx_text_field/fx_text_field.dart';

class FxFilePicker extends StatefulWidget {
  final FxFilePickerController controller;
  final String label;
  final Widget? subTitleWidget;
  final Color? borderColor;
  final void Function(String)? onChange;

  const FxFilePicker(
      {Key? key,
      required this.controller,
      this.subTitleWidget,
      this.onChange,
      this.borderColor,
      this.label = "Select File"})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxFilePicker();
  }
}

class _FxFilePicker extends State<FxFilePicker> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<PlatformFile>? _paths;

  String? _extension;

  Widget? subTitleWidget;

  final FileType _pickingType = FileType.any;

  final TextEditingController _controller = TextEditingController();



  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxTextField(
                      prefixIcon: Icon(
                        Icons.attach_file,
                        color: InitialStyle.icon,
                      ),
                      borderColor:
                          widget.borderColor ?? InitialStyle.borderInput,
                      onTap: () {
                        _openFileExplorer(
                          (p0) {
                            widget.onChange!(p0);
                          },
                        );
                      },
                      controller: _controller,
                    ),
                    const FxVSpacer(),
                    widget.subTitleWidget ?? Container()
                  ],
                ),
              ),
            ]),
      ),
    ));
  }


  String _unit8ListTob64(List<PlatformFile> path) {
    String base64String = base64Encode(path.first.bytes!);
    String header = "data:${path.first.name};base64,";
    return header + base64String;
  }

  void _openFileExplorer(void Function(String) onchange) async {
    setState(() {
      _controller.text = "";
    });
    try {
      _paths = (await FilePicker.platform.pickFiles(
        withData: true,
        type: _pickingType,
        allowMultiple: false,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Unsupported operation$e");
      }
    } catch (ex) {
      if (kDebugMode) {
        print(ex);
      }
    }
    if (!mounted) return;
    setState(() {
      //print(_paths!.first.extension);

      _controller.text = _paths!.first.name;

      widget.controller.base64File = _unit8ListTob64(_paths!);

      onchange(widget.controller.base64File);
    });
  }
}

class FxFilePickerController {
  String base64File = "";
}
