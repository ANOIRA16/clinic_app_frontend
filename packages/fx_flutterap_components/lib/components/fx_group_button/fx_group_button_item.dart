import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';

class FxGroupButtonItem extends StatelessWidget {
  const FxGroupButtonItem({
    Key? key,
    required this.onPressed,
    // required this.text,
    required this.widget,
    required this.isSelected,
    required this.isDisable,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.selectedColor,
    this.unselectedColor,
    this.borderRadius,
    this.selectedShadow,
    this.unselectedShadow,
    this.height,
    this.width,
    this.textAlign,
    this.textPadding,
    this.alignment,
    this.elevation,
  }) : super(key: key);

  // final String text;
  final Widget widget;
  final void Function()? onPressed;
  final bool isSelected;
  final bool isDisable;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? selectedShadow;
  final List<BoxShadow>? unselectedShadow;
  final double? height;
  final double? width;
  final TextAlign? textAlign;
  final EdgeInsets? textPadding;
  final AlignmentGeometry? alignment;
  final double? elevation;

  bool get isEnabled => !isDisable;

  List<BoxShadow>? get _boxShadow => isSelected
      ? selectedShadow
      : isEnabled
          ? unselectedShadow
          : null;

  Color? get _borderColor => isSelected
      ? selectedBorderColor ?? unselectedBorderColor
      : isEnabled
          ? unselectedBorderColor
          : null;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: _boxShadow,
      ),
      child: !isDisable
          ? _customButton(context, onPressed)
          : GestureDetector(
              onTap: onPressed,
              child: _customButton(context, null),
            ),
    );
  }

  Widget _customButton(BuildContext context, void Function()? onPressed) {
    // final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        elevation: elevation ?? 0.0,
        // ignore: deprecated_member_use
        primary: _getBackgroundColor(),
        shape: _buildShape(),
        // padding: (width != null || height != null) ? EdgeInsets.all(0) : null,
        padding: const EdgeInsets.all(0),
        alignment: (width != null || height != null) ? alignment : null,
      ),
      // child: Padding(
      //   padding: textPadding ?? EdgeInsets.zero,
      //   child: Text(
      //     text,
      //     textAlign: textAlign,
      //     style: _textStyle,
      //   ),
      // ),
      child: widget,
    );
  }

  Color? _getBackgroundColor() {
    final themePrimaryColor = InitialStyle.secondaryDarkColor;
    const themeSecondaryColor = Colors.transparent;

    var selectedColorBuffer = selectedColor;
    var unselectedColorBuffer = unselectedColor;

    selectedColorBuffer ??= themePrimaryColor;
    unselectedColorBuffer ??= themeSecondaryColor;

    final color = isSelected
        ? selectedColorBuffer
        : isEnabled
            ? unselectedColorBuffer
            : null;
    return color;
  }

  OutlinedBorder? _buildShape() {
    final color = _borderColor;
    if (borderRadius != null) {
      return RoundedRectangleBorder(
        borderRadius: borderRadius!,
        side: _buildBorderSide(color),
      );
    } else {
      return RoundedRectangleBorder(side: _buildBorderSide(color));
    }
  }

  BorderSide _buildBorderSide(Color? color) {
    if (color != null) {
      return BorderSide(color: color);
    }
    return BorderSide.none;
  }
}
