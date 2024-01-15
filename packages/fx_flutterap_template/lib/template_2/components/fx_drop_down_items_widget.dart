import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import '../structure/structure_dims.dart';
import '../structure/structure_styles.dart';

class FxDropdownItemsWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const FxDropdownItemsWidget({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.all(InitialDims.space3),
        child: FxText(
          title,
          tag: Tag.h5,
          color: InitialStyle.primaryLightColor,
        ),
      ),
    );
  }
}
