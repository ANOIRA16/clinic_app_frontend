import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_block_button.dart';
import 'package:fx_flutterap_components/components/fx_form/fx_checkbox/fx_custom_checkbox_form.dart';
import 'package:fx_flutterap_components/components/fx_form/fx_text_field/fx_text_field_form.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_kernel/structure/global_variables.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import '../../../../config/ui/appbar/language_drop_down_menu.dart';
import '../components/global_widgets/fx_authentication_frame.dart';

class FcSignin extends StatefulWidget {
  static const routeName = '/fx-sign-in';

  const FcSignin({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FxSignin();
  }
}

class _FxSignin extends State<FcSignin> {
  bool isChecked = true;
  final _formkey = GlobalKey<FormState>();
  String _repeatedValue = "";
  final bool _value1 = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FxAuthenticationFrame(
      imagePath: "assets/images/signin.png",
      formContent:    Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LanguageDropDownMenu(
                nightMode: nightMode,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: InitialStyle.icon,
                  )),

            ],
          ),
          const FxVSpacer(
            big: true,
            factor: 5,
          ),
          FxText(
            AppLocalizations.of(context)!.signin,
            tag: Tag.h3,
            color: InitialStyle.titleTextColor,
            isBold: true,
          ),
          const FxVSpacer(
            big: true,
            factor: 2,
          ),
          FxText(
            AppLocalizations.of(context)!.createanewaccount,
            color: InitialStyle.secondaryTextColor,
          ),
          const FxVSpacer(
            big: true,
            factor: 5,
          ),
          Form(
            key: _formkey,
            child: Column(
              children: [
                FxTextFieldForm(
                  hint: "",
                  label: AppLocalizations.of(context)!.username,
                  validator: (value) {
                    if (value!.length < 4) {
                      return AppLocalizations.of(context)!
                          .theinputlengthistooshort;
                    }
                    return null;
                  },
                ),
                const FxVSpacer(
                  big: true,
                  factor: 2,
                ),
                FxTextFieldForm(
                  hint: "",
                  label: AppLocalizations.of(context)!.emailadress,
                  validator: (value) {
                    if (value!.length < 4) {
                      return AppLocalizations.of(context)!
                          .theinputlengthistooshort;
                    }
                    return null;
                  },
                ),
                const FxVSpacer(
                  big: true,
                  factor: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FxTextFieldForm(
                        hint: "",
                        label:
                        AppLocalizations.of(context)!.password,
                        validator: (value) {
                          setState(() {
                            _repeatedValue = value ?? "";
                          });
                          if (value!.length < 4) {
                            return AppLocalizations.of(context)!
                                .theinputlengthistooshort;
                          }
                          return null;
                        },
                      ),
                    ),
                    const FxHSpacer(),
                    Expanded(
                      child: FxTextFieldForm(
                        hint: "",
                        label: AppLocalizations.of(context)!
                            .repeatthepassword,
                        validator: (value) {
                          if (value!.length < 4) {
                            return AppLocalizations.of(context)!
                                .theinputlengthistooshort;
                          }

                          if (value != _repeatedValue) {
                            return AppLocalizations.of(context)!
                                .theinputmustberepeated;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const FxVSpacer(
                  big: true,
                  factor: 2,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    (MediaQuery.of(context).size.width <= 300)
                        ? Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        FxCustomCheckBoxForm(
                          titleWidget: Container(),
                          value: _value1,
                          validator: (value) {
                            if (value == false) {
                              return AppLocalizations.of(
                                  context)!
                                  .youshouldacceptthetermsandconditionsbeforeregister;
                            }
                            return null;
                          },
                        ),
                        FxText(
                          AppLocalizations.of(context)!
                              .acceptthetermsandconditions,
                          tag: Tag.h5,
                        ),
                      ],
                    )
                        : FxCustomCheckBoxForm(
                      titleWidget: FxText(
                        AppLocalizations.of(context)!
                            .acceptthetermsandconditions,
                      ),
                      value: _value1,
                      validator: (value) {
                        if (value == false) {
                          return AppLocalizations.of(context)!
                              .youshouldacceptthetermsandconditionsbeforeregister;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const FxVSpacer(
            big: true,
            factor: 2,
          ),
          FxBlockButton(
            text: AppLocalizations.of(context)!.createaccount,
            onTap: () {
              if (_formkey.currentState?.validate() == true) {
                {
                  Navigator.pushNamed(context, '/');
                }
              }
            },
          ),
          const FxVSpacer(
            big: true,
            factor: 2,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/fx-login');
                  },
                  child: FxText(
                    AppLocalizations.of(context)!.haveanaccount,
                    isBold: true,
                  )),
            ],
          ),
        ],
      ),);
  }

}
