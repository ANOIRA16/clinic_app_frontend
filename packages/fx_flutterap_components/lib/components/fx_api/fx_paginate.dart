import 'package:flutter/material.dart';

class FxPaginate extends StatefulWidget {
  final Function()? onFinish;
  final Widget child;
  final ScrollController listScrollController;

  const FxPaginate({Key? key, this.onFinish, required this.child,
    required this.listScrollController}) : super(key: key);

  @override
  State<FxPaginate> createState() => _FxPaginateState();

}

class _FxPaginateState extends State<FxPaginate>
    with AutomaticKeepAliveClientMixin<FxPaginate> {

  final bool _finishFlag = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.listScrollController.jumpTo(0.0000000001,);
    });

    widget.listScrollController.addListener(() {
      double maxScroll = widget.listScrollController.position.maxScrollExtent;
      double currentScroll = widget.listScrollController.position.pixels;

      if (maxScroll - currentScroll == 0) {
        setState(() {




            widget.onFinish!();

          _finishFlag == false;



        });
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


}

