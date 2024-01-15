import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_block_button.dart';
import 'package:fx_flutterap_components/components/fx_form/fx_text_field/fx_text_field_form.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_kernel/structure/global_variables.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import '../../../../config/ui/appbar/language_drop_down_menu.dart';
import '../components/global_widgets/fx_authentication_frame.dart';

class FcLockScreen extends StatelessWidget {
  static const String routeName = '/lock';
  final VoidCallback? unlockScreen;

  const FcLockScreen({Key? key, this.unlockScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final passwordKey = GlobalKey<FormFieldState<String>>();

    return FxAuthenticationFrame(
      imagePath: "assets/images/lock.png",
      formContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FxVSpacer(
            big: true,
            factor: 8,
          ),
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
                ),
              ),
            ],
          ),
          const FxVSpacer(
            big: true,
            factor: 8,
          ),
          FxText(
            AppLocalizations.of(context)!.youraccessneedsunlocking,
            color: InitialStyle.titleTextColor,
            tag: Tag.h3,
            align: TextAlign.center,
            isBold: true,
          ),
          const FxVSpacer(
            big: true,
            factor: 8,
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const FxAvatarImage(
                      path:
                      "packages/fx_flutterap_components/assets/images/img1.jpg",
                    ),
                    const FxHSpacer(),
                    FxTextFieldForm(
                      key: passwordKey,
                      hint: "",
                      label: AppLocalizations.of(context)!.password,
                      textFieldSize: Size(
                        (InitialDims.space25) * 3.5,
                        (InitialDims.space10),
                      ),
                      validator: (value) {
                        if (value == null || value.length < 4) {
                          return AppLocalizations.of(context)!
                              .theinputlengthistooshort;
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
            text: AppLocalizations.of(context)!.unlocking,
            onTap: () {
              if (formKey.currentState?.validate() == true) {
                String? enteredPassword = passwordKey.currentState?.value;
                if (enteredPassword != null && enteredPassword == 'demo') {
                  unlockScreen?.call();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Wrong crendential!')),
                  );
                }
              }
            },
          ),
          const FxVSpacer(
            big: true,
            factor: 2,
          ),
        ],
      ),
    );
  }
}
