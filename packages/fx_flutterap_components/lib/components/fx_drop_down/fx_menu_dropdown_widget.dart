import 'package:flutter/material.dart';

class FxMenuDropdownWidget extends StatelessWidget {
  final Widget? buttonWidget;
  final void Function()? onTap;

  const FxMenuDropdownWidget({Key? key, required this.buttonWidget, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: buttonWidget ?? Container(),
    );
  }
}
