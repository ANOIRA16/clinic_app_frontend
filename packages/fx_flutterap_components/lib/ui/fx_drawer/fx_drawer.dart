import 'package:flutter/material.dart';
import 'package:fx_flutterap_kernel/ui/drawer/drawer_items_processor.dart';

class FxDrawer extends StatelessWidget {
 final List menu;

   const FxDrawer(this.menu, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerItemsProcessor(
      menu: menu,
    );
  }
}
