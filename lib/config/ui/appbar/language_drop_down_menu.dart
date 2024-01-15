import 'package:flutter/material.dart';
import 'package:fx_flutterap_kernel/structure/global_variables.dart';
import 'package:fx_flutterap_template/default_template/components/fx_drop_down_items_widget.dart';
import 'package:fx_flutterap_template/default_template/components/fx_language_drop_down_menu_style.dart';
import 'package:provider/provider.dart';

import '../../../app/local/shared_preferences/save.dart';
import '../../structure_change_provider.dart';

class LanguageDropDownMenu extends StatefulWidget {
  final bool? nightMode;

  const LanguageDropDownMenu({
    Key? key,
    this.nightMode,
  }) : super(key: key);

  @override
  State<LanguageDropDownMenu> createState() => _LanguageDropDownMenuState();
}

class _LanguageDropDownMenuState extends State<LanguageDropDownMenu> {
  List<DropdownMenuItem<String>> _items = [];

  late GlobalKey _dropdownKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = "EN"; // Set initial value to English
    _dropdownKey = GlobalKey();

    _getLocal();
  }

  @override
  Widget build(BuildContext context) {
    _items = [
      DropdownMenuItem(
        value: "EN",
        child: FxDropdownItemsWidget(
          title: "EN",
          onTap: () {
            Navigator.pop(_dropdownKey.currentContext!);
            setState(() {
              selectedValue = "EN";
            });
            context.read<StructureChangeProvider>().changeLocale("en");
            context.read<StructureChangeProvider>().changeCode("EN");

            Save().setLocal("EN");
          },
        ),
      ),
      DropdownMenuItem(
        value: "AR",
        child: FxDropdownItemsWidget(
          title: "AR",
          onTap: () {
            Navigator.pop(_dropdownKey.currentContext!);
            setState(() {
              selectedValue = "AR";
            });
            context.read<StructureChangeProvider>().changeLocale("ar");
            context.read<StructureChangeProvider>().changeCode("AR");
            Save().setLocal("AR");
          },
        ),
      ),
      DropdownMenuItem(
        value: "FR",
        child: FxDropdownItemsWidget(
          title: "FR",
          onTap: () {
            Navigator.pop(_dropdownKey.currentContext!);
            setState(() {
              selectedValue = "FR";
            });
            context.read<StructureChangeProvider>().changeLocale("fr");
            context.read<StructureChangeProvider>().changeCode("FR");
            Save().setLocal("FR");
          },
        ),
      ),

    ];

    return FxLanguageDropDownMenuStyle(
      items: _items,
      nightMode: widget.nightMode ?? false,
      dropdownKey: _dropdownKey,
      value: Provider.of<StructureChangeProvider>(context, listen: true)
          .currentLanguageCode,
    );
  }

  Future<String> _getLocal() async {
    String local = await Save().getLocal();

    setState(() {
      selectedValue = local;
    });
    Future.delayed(Duration.zero, () {
      context
          .read<StructureChangeProvider>()
          .changeLocale(selectedValue.toLowerCase());
      context.read<StructureChangeProvider>().changeCode(selectedValue);
    });
    return selectedValue;
  }
}
