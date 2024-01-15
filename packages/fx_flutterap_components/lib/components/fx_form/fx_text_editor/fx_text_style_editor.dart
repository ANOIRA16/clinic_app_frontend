import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:text_style_editor/text_style_editor.dart';

class FxTextStyleEditor extends StatefulWidget {
  const FxTextStyleEditor({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxTextStyleEditorState();
  }
}

class _FxTextStyleEditorState extends State<FxTextStyleEditor> {
  final List<String> _fonts = [
    'Arabic',
    'Shabnam',
    'Yekan',
    'Calibri',
  ];
  final List<Color> _paletteColors = [
    Colors.black,
    Colors.white,
    Color(int.parse('0xffEA2027')),
    Color(int.parse('0xff006266')),
    Color(int.parse('0xff1B1464')),
    Color(int.parse('0xff5758BB')),
    Color(int.parse('0xff6F1E51')),
    Color(int.parse('0xffB53471')),
    Color(int.parse('0xffEE5A24')),
    Color(int.parse('0xff009432')),
    Color(int.parse('0xff0652DD')),
    Color(int.parse('0xff9980FA')),
    Color(int.parse('0xff833471')),
    Color(int.parse('0xff112CBC4')),
    Color(int.parse('0xffFDA7DF')),
    Color(int.parse('0xffED4C67')),
    Color(int.parse('0xffF79F1F')),
    Color(int.parse('0xffA3CB38')),
    Color(int.parse('0xff1289A7')),
    Color(int.parse('0xffD980FA'))
  ];
  late TextStyle _textStyle;
  late TextAlign _textAlign;

  @override
  void initState() {
    _textStyle = const TextStyle(
      fontSize: 25,
      color: Colors.black,
      fontFamily: 'Calibri',
    );

    _textAlign = TextAlign.left;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: InitialStyle.section,
          borderRadius: BorderRadius.all(
              Radius.circular(InitialDims.border5))),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(InitialDims.space5),
                  child: TextField(
                    style: _textStyle,
                    textAlign: _textAlign,
                    maxLines: 20,
                    cursorColor: InitialStyle.primaryDarkColor,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: InitialStyle.primaryDarkColor),
                          borderRadius: BorderRadius.all(
                              Radius.circular(InitialDims.border3))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: InitialStyle.primaryDarkColor),
                          borderRadius: BorderRadius.all(
                              Radius.circular(InitialDims.border3))),
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: InitialStyle.background,
                    ),
                  ),
                ),
                child: TextStyleEditor(
                  fonts: _fonts,
                  paletteColors: _paletteColors,
                  textStyle: _textStyle,
                  textAlign: _textAlign,
                  initialTool: EditorToolbarAction.fontFamilyTool,
                  onTextAlignEdited: (align) {
                    setState(() {
                      _textAlign = align;
                    });
                  },
                  onTextStyleEdited: (style) {
                    setState(() {
                      _textStyle = _textStyle.merge(style);
                    });
                  },
                  onCpasLockTaggle: (caps) {
                    if (kDebugMode) {
                      print(caps);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
