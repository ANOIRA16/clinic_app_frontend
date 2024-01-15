// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_kernel/local/kernel_save.dart';
import 'package:fx_flutterap_kernel/structure/global_variables.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../app/local/shared_preferences/save.dart';
import '../views/fragment/pages/fc_empty_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InitialPage extends StatefulWidget {
  static const routeName = '/';
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InitialPage();
  }
}

class _InitialPage extends State<InitialPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getIsNightMode();
    _getRoute();
  }

  @override
  Widget build(BuildContext context) {
    return FcEmptyScreen();
  }

  Future<bool> _getIsNightMode() async {
    String nightMode0 = await Save().getMode();

    setState(() {
      nightMode = nightMode0 == "night" ? true : false;
    });

    return nightMode;
  }

  Future<void> _getRoute() async {
    String lastRoute = await KernelSave().getRoute();

    if (!kIsWeb) {
      if (lastRoute != "/") {
        Future.delayed(Duration.zero, () {
          Navigator.pushReplacementNamed(context, lastRoute);
        });
      }
    }
  }
}
