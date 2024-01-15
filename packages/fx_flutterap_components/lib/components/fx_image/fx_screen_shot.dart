import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:screenshot/screenshot.dart';

class FxScreenShot extends StatefulWidget {
  final Widget widget;
  final String? confirmButtonString;
  final Function(Uint8List) onUint8List;

  const FxScreenShot(
      {Key? key,
        required this.widget,
         this.confirmButtonString,
        required this.onUint8List})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxScreenShotState();
  }
}

class _FxScreenShotState extends State<FxScreenShot> {
  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: InitialStyle.section,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: (InitialDims.space5),
                  vertical: (InitialDims.space5),
                ),
                child: Screenshot(
                    controller: screenshotController, child: widget.widget),
              ),
              const FxVSpacer(
                factor: 2,
              ),
              FxButton(
                text:widget.confirmButtonString??'Confirm Above Widget for screen shot',
                onTap: () {
                  screenshotController
                      .capture(delay: const Duration(milliseconds: 1000))
                      .then((capturedImage) async {
                    _showCapturedWidget(context, capturedImage!);
                    widget.onUint8List(capturedImage);
                  }).catchError((onError) {
                    debugPrint(onError);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          backgroundColor: InitialStyle.primaryDarkColor,
        ),
        body: SingleChildScrollView(
          child: Center(child: Image.memory(capturedImage)),
        ),
      ),
    );
  }
}
