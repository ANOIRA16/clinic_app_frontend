// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_builder.dart';
import 'package:fx_flutterap_template/default_template/appbar_style/app_bar_style.dart';
import 'package:fx_flutterap_template/default_template/drawer_style/drawer_style.dart';

import '../../config/ui/appbar/language_drop_down_menu.dart';
import '../../config/ui/appbar/theme_button.dart';
import '../../config/ui/drawer/drawer_config.dart';

class AdminPanelLayout extends StatelessWidget {
  final Widget child;

  const AdminPanelLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StructureBuilder(
      drawer: DrawerStyle(
          adminPanelTitle: AppLocalizations.of(context)!.adminpaneltitle,
          fullName: AppLocalizations.of(context)!.fullname,
          email: AppLocalizations.of(context)!.adminEmail,
          drawerItems: DrawerConfig()),
      appbar: AppBarStyle(
        languageDropDownMenu: LanguageDropDownMenu(),
        themeButton: ThemeButton(),
      ),
      child: child,
    );
  }
}
