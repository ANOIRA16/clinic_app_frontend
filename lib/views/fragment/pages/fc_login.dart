import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_block_button.dart';
import 'package:fx_flutterap_components/components/fx_form/fx_text_field/fx_text_field_form.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_kernel/structure/global_variables.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import '../../../../config/ui/appbar/language_drop_down_menu.dart';
import '../components/global_widgets/fx_authentication_frame.dart';

class FcLogin extends StatefulWidget {
  static const routeName = '/login';

  // Define a callback function type
  final Function(String username, String password)? onLogin;

  // Update the constructor to include the onLogin callback
  const FcLogin({Key? key, this.onLogin}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FxLogin();
}

class _FxLogin extends State<FcLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? validator(String? value) {
    if (value == null || value.isEmpty || value.length < 4) {
      return "The input length is too short";
    }
    return null;
  }


  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FxAuthenticationFrame(
      imagePath: "assets/images/lock.png",
      formContent: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LanguageDropDownMenu(nightMode: nightMode),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, color: InitialStyle.icon),
              ),
            ],
          ),
          const FxVSpacer(big: true, factor: 10),
          FxText(
            AppLocalizations.of(context)!.panelmanagement,
            tag: Tag.h3,
            color: InitialStyle.titleTextColor,
            align: TextAlign.start,
            isBold: true,
          ),
          const FxVSpacer(big: true, factor: 5),
          FxText(
            AppLocalizations.of(context)!.fillfieldstocontinue,
            color: InitialStyle.secondaryTextColor,
          ),
          const FxVSpacer(big: true, factor: 5),
          Form(
            key: _formKey,
            child: Column(
              children: [
                FxTextFieldForm(
                  hint: "",
                  label: AppLocalizations.of(context)!.emailoruserName,
                  controller: _usernameController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 4) {
                      return AppLocalizations.of(context)!.theinputlengthistooshort;
                    }
                    return null;
                  },
                ),
                const FxVSpacer(big: true, factor: 5),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "",
                    labelText: AppLocalizations.of(context)!.password,
                  ),
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 4) {
                      return AppLocalizations.of(context)!.theinputlengthistooshort;
                    }
                    return null;
                  },
                ),
                const FxVSpacer(big: true, factor: 5),
                FxBlockButton(
                  text: AppLocalizations.of(context)!.login,
                  onTap: () {
                    if (_formKey.currentState?.validate() == true) {
                      widget.onLogin?.call(_usernameController.text, _passwordController.text);
                      if (_usernameController.text == 'admin' && _passwordController.text == 'admin') {
                        Navigator.pushNamed(context, '/');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AppLocalizations.of(context)!.loginError),
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
