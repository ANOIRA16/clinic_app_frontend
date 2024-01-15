import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';

import '../fx_text/fx_text.dart';

class FxStepper extends StatefulWidget {
  final StepperType? direction;
  final List<Widget> stepWidgets;
  final List<String> titleList;
  final String? nextString;
  final String? backString;

  const FxStepper({
    Key? key,
    required this.stepWidgets,
    required this.titleList,
    this.direction,
    this.nextString,
    this.backString,
  }) : super(key: key);

  @override
  State<FxStepper> createState() => _FxStepperState();
}

class _FxStepperState extends State<FxStepper> {
  List<GlobalKey<FormState>> _formKeys = [];
  int _currentStep = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKeys = List.generate(
        widget.stepWidgets.length, (index) => GlobalKey<FormState>());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(InitialDims.border3))),
      child: Stepper(
        type: widget.direction ?? StepperType.horizontal,
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: InitialDims.space5),
            child: Row(
              children: <Widget>[
                if (_currentStep != 0)
                  FxButton(
                    text: widget.backString ?? "Back",
                    fillColor: InitialStyle.secondaryDarkColor,
                    onTap: controls.onStepCancel,
                  ),
                const FxHSpacer(),
                if (_currentStep != _steps().length - 1)
                  FxButton(
                    text: widget.nextString ?? "Next",
                    onTap: controls.onStepContinue,
                  ),
              ],
            ),
          );
        },
        onStepTapped: (step) => setState(() => _currentStep = step),
        onStepContinue: () {
          setState(() {
            if (_currentStep < _steps().length - 1) {
              if (_formKeys[_currentStep].currentState!.validate()) {
                _currentStep += 1;
              }
            } else {
              _currentStep = 0;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep -= 1;
            } else {
              _currentStep = 0;
            }
          });
        },
        steps: _steps(),
        currentStep: _currentStep,
      ),
    );
  }

  _stepState(int step) {
    if (_currentStep > step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
  }

  _steps() => List.generate(
        widget.stepWidgets.length,
        (index) => Step(
          title: FxText(
            widget.titleList[index],
            tag: Tag.h3,
            color: InitialStyle.primaryDarkColor,
          ),
          content:
              Form(key: _formKeys[index], child: widget.stepWidgets[index]),
          state: _stepState(index),
          isActive: _currentStep == index,
        ),
      );
}
