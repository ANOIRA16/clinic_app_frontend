// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fx_flutterap_kernel/structure/global_variables.dart';
import 'package:fx_flutterap_template/default_template/components/fx_theme_button_widget.dart';
import 'package:provider/provider.dart';

import '../../../app/local/shared_preferences/save.dart';
import '../../structure_change_provider.dart';

class ThemeButton extends StatefulWidget {


  const ThemeButton({
    Key? key,

  }) : super(key: key);

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          nightMode = !nightMode;
        });
        await Save().setMode(nightMode ? "night" : "day");

        Future.delayed(Duration.zero, () {
          context.read<StructureChangeProvider>().changeMode(nightMode);
        });
      },
      child: FxThemeButtonWidget(),
    );
  }
}
