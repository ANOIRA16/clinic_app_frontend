import 'package:flutter/foundation.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

///this class is a customized text field that use in whole of app
class FxTextFieldForm extends StatefulWidget {
  final String? hint;
  final String? label;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInput;

  final String? Function(String?)? validator;
  final TextEditingController? controller;

  final EditTextController? customController;
  final ValueChanged<String>? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;

  // String Function(String value)? checkRepeat;////////////////////

  final FocusNode? focusNode;

  final FocusNode? nextFocusNode;
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
  final TextStyle? hintStyle;

  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? borderStyle;

  const FxTextFieldForm(
      {Key? key,
      this.hint,
      this.label,
      this.validator,
      this.textInput,
      this.suffixIcon,
      this.prefixIcon,
      this.onEditingComplete,
      this.onTap,
      this.customController,
      this.focusNode,
      this.isObscure,
      this.disabled,
      this.nextFocusNode,
      this.textAlign,
      this.textDirection,
      this.maxLength,
      this.maxLines,
      this.textFieldSize,
      this.checkRegex,
      this.fillColor,
      this.borderColor,
      this.textStyle,
      this.labelStyle,
      this.hintStyle,
      this.controller,
      this.onChanged,
      this.disabledBorder,
      this.borderStyle,
      this.focusedBorder,
      this.focusedErrorBorder})
      : super(key: key)
  // :assert(customController != null)
  ;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EsSpecificTextField();
  }
}

class _EsSpecificTextField extends State<FxTextFieldForm> {
  Color _borderColor = InitialStyle.borderInput;

  final RegExp _phoneReg = RegExp(
    "(9)[0-9]{9}",
    caseSensitive: false,
    multiLine: false,
  );
  final RegExp _emailReg = RegExp(
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

    Size? size2 = widget.textFieldSize;

    // TODO: implement build
    return Directionality(
      textDirection:
          widget.textDirection ?? (rtl ? TextDirection.rtl : TextDirection.ltr),
      child: SizedBox(
        height: size2?.height,
        width: size2?.width,
        child: TextFormField(

          onTap: widget.onTap,

          enabled: !((widget.disabled) ?? false),
          readOnly: widget.disabled ?? false,
          validator: widget.validator,
          maxLength: widget.maxLength,
          controller: widget.controller,
          onChanged: _checkChange,
          keyboardType: widget.textInput,
          maxLines: widget.maxLines??1,
          textAlign:
              widget.textAlign ?? (rtl ? TextAlign.right : TextAlign.left),
          style: widget.textStyle ??
              TextStyle(
                  color: InitialStyle.textInput,
                  fontFamily: "Arabic",
                  fontSize: InitialDims.subtitleFontSize),
          onEditingComplete: widget.onEditingComplete,
          focusNode: widget.focusNode,
          obscureText: widget.isObscure ?? false,
          onFieldSubmitted: (v) {
            if (widget.nextFocusNode != null) {
              FocusScope.of(context).requestFocus(widget.nextFocusNode);
            }

          },

          cursorColor: InitialStyle.labelInput,
          decoration: _decoration(),
        ),
      ),
    );
  }

  InputDecoration _decoration() {
    bool isObscure = widget.isObscure ?? false;

    if (isObscure) {
      return InputDecoration(
          prefixIcon: widget.prefixIcon,
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
          filled:  true,
          fillColor: widget.fillColor ?? InitialStyle.backgroundInput,
          enabledBorder: widget.borderStyle ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          widget.borderColor ?? InitialStyle.backgroundInput),
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
                fontFamily: "Arabic",
                color: widget.disabled ?? false
                    ? InitialStyle.secondaryColor
                    : InitialStyle.labelInput,
              ),
          hintStyle: widget.hintStyle ??
              TextStyle(
                fontSize: InitialDims.subtitleFontSize,
                fontFamily: "Arabic",
                color: widget.disabled ?? false
                    ? InitialStyle.secondaryColor
                    : InitialStyle.hintInput,
              ));
    } else {
      return InputDecoration(
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          filled:  true,
          fillColor: widget.fillColor ?? InitialStyle.backgroundInput,
          enabledBorder: widget.borderStyle ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          widget.borderColor ?? InitialStyle.backgroundInput),
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
                fontFamily: "Arabic",
                color: widget.disabled ?? false
                    ? InitialStyle.secondaryColor
                    : InitialStyle.labelInput,
              ),
          hintStyle: widget.hintStyle ??
              TextStyle(
                fontSize: InitialDims.subtitleFontSize,
                fontFamily: "Arabic",
                color: widget.disabled ?? false
                    ? InitialStyle.secondaryColor
                    : InitialStyle.hintInput,
              ));
    }
  }

  void _checkChange(String value) {
    if (widget.onChanged != null) widget.onChanged!(value);
    if (value.isNotEmpty) {
      setState(() {
        _borderColor = Colors.red;

        widget.customController?.isAccepted = false;
      });

      _checkSuccess(value);
    } else {
      setState(() {
        _borderColor = widget.borderColor ?? InitialStyle.borderInput;

        widget.customController?.isAccepted = false;
      });
    }
  }

  void _checkSuccess(String value) {
    if (widget.checkRegex ?? false) {
      if (widget.textInput == TextInputType.phone &&
          _phoneReg.hasMatch(value)) {
        _setAccept();
      } else if (widget.textInput == TextInputType.emailAddress &&
          _emailReg.hasMatch(value)) {
        _setAccept();
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
          _setAccept();
        } else {
          setState(() {
            widget.customController?.isAccepted = false;
          });
        }
      } else {
        _setAccept();
      }
    }
  }

  void _setAccept() {
    setState(() {
      _borderColor = InitialStyle.successColorRegular;
      widget.customController?.isAccepted = true;
    });
  }
}

class EditTextController {
  bool isAccepted = false;
}
