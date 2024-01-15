
import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_alert/fx_alerts.dart';
import 'package:fx_flutterap_components/resources/status_checker.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import '../../../resources/constants/enums.dart';
import '../../fx_text/fx_text.dart';



class FxBaseStreamButton extends StatefulWidget {
  final bool shouldPop;
  final Function onPressed;
  final GlobalKey<FormState>? formKey;
  final Function(AsyncSnapshot snapshot)? afterFinish;
  final Stream stream;
  final Widget child;
  final Widget preload;
  final bool useConfidence;

 const FxBaseStreamButton(
      {Key? key,
        required this.stream,
        this.formKey,
        this.shouldPop = false,
        required this.onPressed,
        required this.child,
        required this.preload,
        this.useConfidence = false,
        this.afterFinish}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FxBaseStreamButtonState();
  }
}

class FxBaseStreamButtonState extends State<FxBaseStreamButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return StreamBuilder(
      stream: widget.stream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          isLoading = false;

          if (widget.shouldPop) Navigator.pop(context);

          if (widget.afterFinish != null) {
            widget.afterFinish!(snapshot);
          }

          return mainWidget();
        } else if (snapshot.hasError) {
          isLoading = false;
          WidgetsBinding.instance.addPostFrameCallback((dur) {
            errorManagement(snapshot.error);
          });

          return mainWidget();
        }
        return mainWidget();
      },
    );
  }

  Widget mainWidget() {
    return Container();
  }

  void errorManagement(Object? error) {
    // String title = "";
    String content = "";
    if (error == getError(RequestError.noNet) ||
        error == getError(RequestError.timeOut)) {
      // title = "عدم دسترسی به اینترنت";
      content = "لطفا از اتصال به اینترنت مطمئن شوید و مجددا تلاش نمایید";
      FxAlerts.error(context,"", myContent: Padding(
        padding: EdgeInsets.all(InitialDims.space2),
        child: FxText(
          content,
          align: TextAlign.center,
          color: InitialStyle.dangerColorDark,
        ),
      ) );

    }
  }

  onPress() {
    if (widget.formKey == null) {
      checkConfidence();
    } else {
      if (widget.formKey!.currentState!.validate()) {
        checkConfidence();
      }
    }
  }

  void checkConfidence() {
    if (widget.useConfidence) {
      FxAlerts.confidence(context,
          title: "اخطار",
          content: "آیا از انجام این عملیات مطمئنید؟",
          onConfirmPress: () {
            setState(() {
              isLoading = true;
            });

            widget.onPressed();
          });
    } else {
      setState(() {
        isLoading = true;
      });

      widget.onPressed();
    }
  }
}
