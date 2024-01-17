import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';

class FcEmptyScreen extends StatelessWidget {
  static const routeName = '/fc-empty_screen';

  const FcEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List list = [
      FxContainerItems(
          title: AppLocalizations.of(context)!.emptyscreen,
          information: "It is a empty screen located in "
              "\n fx_flutterap_template/default_template/fx_container_items.dart"
              " \n and is used as: \n "
              """FxContainerItems(
          child: const SizedBox(
            width: double.infinity,
            height: 1000,
          ),
          title: AppLocalizations.of(context)!.emptyscreen,
          information: ""
             ),""",
          child: const SizedBox(
            width: double.infinity,
            height: 1000,
          )),
    ];

    return FxMainBootstrapContainer(
        title: AppLocalizations.of(context)!.emptyscreen,
        list: list,
        bootstrapSizes: 'col-sm-12 col-ml-12 col-lg-12 col-xl-12',
        description: AppLocalizations.of(context)!.emptyscreentitle);
  }
}
