import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:lottie/lottie.dart';

class FxTypingWaitingIndicator extends StatefulWidget {


  const FxTypingWaitingIndicator({
    Key? key,

  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxTypingWaitingIndicatorState();
  }
}

class _FxTypingWaitingIndicatorState extends State<FxTypingWaitingIndicator>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this)
      ..duration = const Duration(milliseconds: 500)
      ..addStatusListener((status)async {
        if (status == AnimationStatus.completed) {
          await _controller.reverse();
          _controller.forward();
        }
      });

    _controller.forward();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Lottie.asset(
      'packages/fx_flutterap_components/assets/lotties/is_typing.json',
      controller: _controller,
      repeat: false,
      width: InitialDims.space15,
    );
  }
}
