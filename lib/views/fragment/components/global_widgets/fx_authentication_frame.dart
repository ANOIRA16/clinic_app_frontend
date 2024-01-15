import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_kernel/structure/responsive_layout.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxAuthenticationFrame extends StatefulWidget {

  final String imagePath;
  final Widget formContent;

  const FxAuthenticationFrame({Key? key,
  required this.imagePath,
  required this.formContent,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FxAuthenticationFrame();
  }
}

class _FxAuthenticationFrame extends State<FxAuthenticationFrame> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: InitialStyle.section,
        resizeToAvoidBottomInset: true,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: InitialDims.space15,
                right: InitialDims.space5,
                top: InitialDims.space5,
              ),
              child: Wrap(
                runSpacing: InitialDims.space5,

                  children: [
                _boxShow(
                  widget.formContent
                ),
                const FxHSpacer(
                  big: true,
                ),
                (ResponsiveLayot.isLargeTablet(context)
                    ? Image.asset(
                        widget.imagePath,
                        width: (InitialDims.space25) * 4,
                        height: (InitialDims.space25) * 4,
                        fit: BoxFit.contain,
                      )
                    : const SizedBox(
                        width: 0,
                        height: 0,
                      )),
                ((ResponsiveLayot.isMediumComputer(context)||ResponsiveLayot.isComputer(context))
                    ? Image.asset(
                        widget.imagePath,
                        width: (InitialDims.space25) *6,
                        height: (InitialDims.space25) * 6,
                        fit: BoxFit.contain,
                      )
                    : const SizedBox(
                        width: 0,
                        height: 0,
                      )),
              ]),
            ),
          ),
        ));
  }

  Widget _boxShow(Widget widget) {
    return Container(
      width: (InitialDims.space25) * 5,
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.symmetric(
        horizontal: InitialDims.space1,
        vertical: InitialDims.space1,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: InitialDims.space20,
      ),
      decoration: BoxDecoration(color: InitialStyle.cardColor),
      child: widget,
    );
  }
}
