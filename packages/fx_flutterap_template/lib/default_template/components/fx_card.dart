import 'package:flutter/material.dart';
import '../structure/structure_dims.dart';
import '../structure/structure_styles.dart';

class FxCard extends StatelessWidget {
  final Widget body;
  final Widget? header;
  final Widget? footer;
  final double? height;
  final EdgeInsetsGeometry? bodyPadding;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const FxCard(
      {Key? key,
      required this.body,
       this.header,
       this.footer,
       this.height,
       this.bodyPadding,
       this.margin,
       this.padding,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        clipBehavior: Clip.antiAlias,
        padding:padding?? EdgeInsets.all(InitialDims.space5),
        margin:margin?? EdgeInsets.symmetric(
          vertical: (InitialDims.space2),
          horizontal: InitialDims.space2,
        ),
        decoration: BoxDecoration(
          color: InitialStyle.cardColor,
          borderRadius:
              BorderRadius.all(Radius.circular((InitialDims.border3))),
          boxShadow: [
            BoxShadow(
              color: InitialStyle.shadow,
              blurRadius: InitialDims.space5
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            header==null?Container():Padding(
              padding: EdgeInsets.only(bottom: InitialDims.space1),
              child:  header
            ),
            Padding(
              padding:bodyPadding?? EdgeInsets.all(InitialDims.space1),
              child: body,
            ),
            footer==null?Container():Padding(
                padding: EdgeInsets.only(top: InitialDims.space1),
                child:  footer
            ),
          ],
        ),
      ),
    );
  }
}
