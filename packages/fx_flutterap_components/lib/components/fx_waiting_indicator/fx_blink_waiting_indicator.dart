import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxBlinkWaitingIndicator extends StatefulWidget {
  final double? size;
  final int? duration;
  final Color? color;

  const FxBlinkWaitingIndicator({
    Key? key,
    this.size,
    this.duration,
    this.color,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxBlinkWaitingIndicatorState();
  }
}

class _FxBlinkWaitingIndicatorState extends State<FxBlinkWaitingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late Animation _colorAnimation;
  late int _duration;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _duration = widget.duration ?? 400;
    _controller = AnimationController(vsync: this)
      ..duration = Duration(milliseconds: _duration)
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          await _controller.reverse();
          _controller.forward();
        }
      });

    _controller.forward();
    double size0 = widget.size ?? InitialDims.icon3;
    _animation = Tween<double>(
      begin: size0 * 0.7,
      end: size0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });
    _colorAnimation = ColorTween(
      begin: InitialStyle.primaryLightColor,
      end: widget.color ?? InitialStyle.primaryDarkColor,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: _animation.value,
          height: _animation.value,
          decoration: BoxDecoration(
              color: _colorAnimation.value,
              borderRadius:
                  BorderRadius.all(Radius.circular(_animation.value))),
        ),
      ],
    );
  }
}
