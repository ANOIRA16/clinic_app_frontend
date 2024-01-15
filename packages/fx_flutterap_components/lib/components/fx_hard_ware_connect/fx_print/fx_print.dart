// import 'dart:typed_data';
import 'package:fx_flutterap_components/components/fx_image/fx_screen_shot.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxPrint extends StatefulWidget {
  final Widget widget;
  final String? confirmButtonString;

  const FxPrint({Key? key, required this.widget, this.confirmButtonString}) : super(key: key);

  @override
  State<FxPrint> createState() => _FxPrintState();
}

class _FxPrintState extends State<FxPrint> {
  Uint8List? uint8List;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FxScreenShot(
        widget: widget.widget,
        confirmButtonString: widget.confirmButtonString,
        onUint8List: (uint8listNew) {
          uint8List = uint8listNew;
          _showCapturedWidget();
        });
  }

  Future<dynamic> _showCapturedWidget() {
    return showDialog(
        useSafeArea: false,
        context: context,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: InitialStyle.primaryDarkColor,
            ),
            body: PdfPreview(
              build: (format) {
                return _generatePdf(format, context);
              },
            ),
          );
        });
  }

  Future<Uint8List> _generatePdf(
      PdfPageFormat format, BuildContext contextTotal) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    String path = "packages/fx_flutterap_components/assets/images/img3.jpg";
    // final _image = await imageFromAssetBundle(path);//use from assets

    final ByteData bytes = await rootBundle.load(path);
    final Uint8List list = bytes.buffer.asUint8List();
    final image = pw.MemoryImage(uint8List ?? list);

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Image(image);
        },
      ),
    );

    return pdf.save();
  }
}
