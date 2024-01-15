import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';

class FxAvatarGroup extends StatelessWidget {
  final List<Widget> avatarList;
  final List<double>? alignList;
  final double? width;

  const FxAvatarGroup(
      {Key? key, required this.avatarList, this.alignList, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<double> alignfactor =
        alignList ?? List.generate(avatarList.length, (index) => 0.4);
    double width0 = width ?? (InitialDims.space25) *2;

    return SizedBox(
      width: width0,
      child: Stack(
        children: [
          ...List.generate(
            avatarList.length,
            (index) => Align(
                alignment: Alignment(index * alignfactor[index], 0),
                child: avatarList[index]),
          )
        ],
      ),
    );
  }
}
