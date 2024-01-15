import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:intl/intl.dart' as intl;

///this class is a customized text field that use in whole of app
class FxMaskedInputTextField extends StatefulWidget {
  final String? hint;
  final String? label;
  final TextInputFormatter maskTextInputFormatter;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInput;

  final TextEditingController? controller;

  final EditTextController? customController;
  final ValueChanged<String>? onChanged;
  final void Function()? onEditingComplete;

  // String Function(String value)? checkRepeat;////////////////////

  final FocusNode? focusNode;
  final bool? checkRegex;

  final bool? isObscure;
  final bool? disabled;

  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final int? maxLength;
  final int? maxLines;

  final Size? textFieldSize;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;

  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? borderStyle;

  const FxMaskedInputTextField(
      {Key? key,
      required this.maskTextInputFormatter,
      this.hint,
      this.label,
      this.textInput = TextInputType.text,
      this.suffixIcon,
      this.prefixIcon,
      this.onEditingComplete,
      required this.customController,
      this.focusNode,
      this.isObscure,
      this.disabled,
      this.textAlign,
      this.textDirection,
      this.maxLength,
      this.maxLines,
      this.textFieldSize,
      this.checkRegex,
      this.fillColor,
      this.borderColor,
      this.labelStyle,
      this.textStyle,
      this.controller,
      this.onChanged,
      this.disabledBorder,
      this.borderStyle,
      this.focusedBorder,
      this.focusedErrorBorder})
      : assert(customController != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EsSpecificTextField();
  }
}

class _EsSpecificTextField extends State<FxMaskedInputTextField> {
  Color _borderColor = InitialStyle.backgroundInput;

  RegExp phoneReg = RegExp(
    "(09)[0-9]{9}",
    caseSensitive: false,
    multiLine: false,
  );
  RegExp emailReg = RegExp(
    r"^[a-zA-Z\d.]+@[a-zA-Z\d]+\.[a-zA-Z]+",
    caseSensitive: false,
    multiLine: false,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _borderColor = widget.borderColor ?? InitialStyle.backgroundInput;
  }

  @override
  Widget build(BuildContext context) {
    bool isDirectionRTL(BuildContext context) {
      return intl.Bidi.isRtlLanguage(
          Localizations.localeOf(context).languageCode);
    }

    bool rtl = isDirectionRTL(context);

    Size size = widget.textFieldSize ??
        Size((InitialDims.space25) * 3,
            (InitialDims.space10)  * (widget.maxLines ?? 1));

    // TODO: implement build
    return Directionality(
      textDirection:
          widget.textDirection ?? (rtl ? TextDirection.rtl : TextDirection.ltr),
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: TextField(
          enabled: !((widget.disabled) ?? false),
          readOnly: widget.disabled ?? false,
          inputFormatters: [widget.maskTextInputFormatter],
          maxLength: widget.maxLength,
          controller: widget.controller,
          onChanged: checkChange,
          keyboardType: widget.textInput,
          maxLines: widget.maxLines ?? 1,
          textAlign: widget.textAlign ?? TextAlign.right,
          style: widget.textStyle ??
              TextStyle(
                  color: InitialStyle.labelInput,
                  fontSize: InitialDims.subtitleFontSize),
          onEditingComplete: widget.onEditingComplete,
          focusNode: widget.focusNode,
          obscureText: widget.isObscure ?? false,
          cursorColor: InitialStyle.labelInput,
          decoration: decoration(),
        ),
      ),
    );
  }

 InputDecoration decoration() {
    bool isObscure = widget.isObscure ?? false;

    if (isObscure) {
      return InputDecoration(
          suffixIcon: widget.suffixIcon ??
              InkWell(
                onTap: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(isObscure ? Icons.visibility : Icons.visibility_off,
                    color: InitialStyle.disableColorRegular),
              ),
          prefixIcon: widget.prefixIcon,
          filled:  true,
          fillColor: widget.fillColor ?? InitialStyle.backgroundInput,
          enabledBorder: widget.borderStyle ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          widget.borderColor ?? _borderColor),
                  borderRadius: BorderRadius.all(
                      Radius.circular(InitialDims.border2))),
          focusedBorder: widget.focusedBorder ??
              OutlineInputBorder(
                  borderSide: BorderSide(color: InitialStyle.borderInput),
                  borderRadius: BorderRadius.all(
                      Radius.circular(InitialDims.border2))),
          focusedErrorBorder: widget.focusedErrorBorder ??
              OutlineInputBorder(
                  borderSide:
                      BorderSide(color: InitialStyle.dangerColorRegular),
                  borderRadius: BorderRadius.all(
                      Radius.circular(InitialDims.border2))),
          border: widget.borderStyle ??
              OutlineInputBorder(
                  borderSide: BorderSide(color: _borderColor),
                  borderRadius: BorderRadius.all(
                      Radius.circular(InitialDims.border2))),
          disabledBorder: widget.disabledBorder ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          widget.fillColor ?? InitialStyle.backgroundInput),
                  borderRadius: BorderRadius.all(
                      Radius.circular(InitialDims.border2))),
          contentPadding: EdgeInsets.all(InitialDims.space2),
          alignLabelWithHint: false,
          labelText: widget.label,
          hintText: widget.hint,
          labelStyle: widget.labelStyle ??
              TextStyle(
                  fontSize: InitialDims.subtitleFontSize,
                  color: InitialStyle.labelInput));
    } else {
      return InputDecoration(
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        filled:  true,
        fillColor: widget.fillColor ?? InitialStyle.backgroundInput,
        enabledBorder: widget.borderStyle ??
            OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.borderColor ??_borderColor),
                borderRadius: BorderRadius.all(
                    Radius.circular(InitialDims.border2))),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
                borderSide: BorderSide(color: InitialStyle.borderInput),
                borderRadius: BorderRadius.all(
                    Radius.circular(InitialDims.border2))),
        focusedErrorBorder: widget.focusedErrorBorder ??
            OutlineInputBorder(
                borderSide: BorderSide(color: InitialStyle.dangerColorRegular),
                borderRadius: BorderRadius.all(
                    Radius.circular(InitialDims.border2))),
        border: widget.borderStyle ??
            OutlineInputBorder(
                borderSide: BorderSide(color: _borderColor),
                borderRadius: BorderRadius.all(
                    Radius.circular(InitialDims.border2))),
        disabledBorder: widget.disabledBorder ??
            OutlineInputBorder(
                borderSide: BorderSide(
                    color:
                        widget.fillColor ?? InitialStyle.backgroundInput),
                borderRadius: BorderRadius.all(
                    Radius.circular(InitialDims.border2))),
        contentPadding: EdgeInsets.all(InitialDims.space2),
        alignLabelWithHint: false,
        hintText: widget.hint,
        labelText: widget.label,
        labelStyle: widget.labelStyle ??
            TextStyle(
                fontSize: InitialDims.subtitleFontSize,
                color: InitialStyle.labelInput),
      );
    }
  }

  void checkChange(String value) {
    if (widget.onChanged != null) widget.onChanged!(value);
    if (value.isNotEmpty) {
      setState(() {
        _borderColor = Colors.red;

        widget.customController?.isAccepted = false;
      });

      checkSuccess(value);
    } else {
      setState(() {
        _borderColor = widget.borderColor ?? InitialStyle.backgroundInput;

        widget.customController?.isAccepted = false;
      });
    }
  }

  void checkSuccess(String value) {
    if (widget.checkRegex ?? false) {
      if (widget.textInput == TextInputType.phone && phoneReg.hasMatch(value)) {
        setAccept();
      } else if (widget.textInput == TextInputType.emailAddress &&
          emailReg.hasMatch(value)) {
        setAccept();
      } else {
        setState(() {
          widget.customController?.isAccepted = false;
        });
      }
    } else {
      if (widget.maxLength != null) {
        if (kDebugMode) {
          print(widget.maxLength);
        }

        if (value.length == widget.maxLength) {
          setAccept();
        } else {
          setState(() {
            widget.customController?.isAccepted = false;
          });
        }
      } else {
        setAccept();
      }
    }
  }

  void setAccept() {
    setState(() {
      _borderColor = InitialStyle.successColorRegular;
      widget.customController?.isAccepted = true;
    });
  }
}

class EditTextController {
  bool isAccepted = false;
}
