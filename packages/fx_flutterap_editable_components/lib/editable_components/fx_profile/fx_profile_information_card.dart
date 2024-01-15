// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_table/fx_simple_table.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_icon_text.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxProfileInformationCard extends StatelessWidget {
  final String? name;
  final String? lastName;
  final String? job;
  final int? age;
  final String? city;
  final String? address;
  final String? phone;
  final String? email;
  final void Function()? editFunction;

  const FxProfileInformationCard({
    Key? key,
    this.name,
    this.lastName,
    this.job,
    this.age,
    this.city,
    this.address,
    this.phone,
    this.email,
    this.editFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxCard(
      margin: EdgeInsets.all(InitialDims.space0),
      padding: EdgeInsets.symmetric(
        vertical: InitialDims.space3,
        horizontal: InitialDims.space3,
      ),      header:   Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxIconText(
            AppLocalizations.of(context)!.information.toUpperCase(),
            color: InitialStyle.titleTextColor,
            size: InitialDims.normalFontSize,
            isBold: true,
            icon: Icon(
              Icons.circle,
              size: InitialDims.icon1,
              color: InitialStyle.primaryColor,
            ),
          ),
          InkWell(
            onTap: editFunction,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FxText(
                  AppLocalizations.of(context)!.editprofile,
                  tag: Tag.h4,
                ),
                Icon(
                  Icons.edit,
                  color: InitialStyle.icon,
                  size: InitialDims.icon3,
                )
              ],
            ),
          )
        ],
      ),
      body:  IntrinsicWidth(
        child: FxSimpleTable(
          dividerThickness: 0.000001,
          horizontalMargin: 0,
          headingRowHeight: 0,
          tableHeight: InitialDims.space25 * 2 + InitialDims.space10,
          columnSpacing: InitialDims.space5,
          headingColor: InitialStyle.cardColor,
          rowsContent: [
            [
              FxText(
                AppLocalizations.of(context)!.firstname,
                align: TextAlign.start,
                color: InitialStyle.titleTextColor,
                tag: Tag.h5,
              ),
              FxText(
                name ?? AppLocalizations.of(context)!.adminname,
                tag: Tag.h5,
              ),
            ],
            [
              FxText(
                AppLocalizations.of(context)!.lastname,
                tag: Tag.h5,
                align: TextAlign.start,
                color: InitialStyle.titleTextColor,
              ),
              FxText(
                lastName ?? AppLocalizations.of(context)!.adminlastname,
                tag: Tag.h5,
              ),
            ],
            [
              FxText(
                AppLocalizations.of(context)!.age,
                tag: Tag.h5,
                align: TextAlign.start,
                color: InitialStyle.titleTextColor,
              ),
              FxText(
                (age??"27").toString(),
                tag: Tag.h5,
              ),
            ],
            [
              FxText(
                AppLocalizations.of(context)!.job,
                tag: Tag.h5,
                align: TextAlign.start,
                color: InitialStyle.titleTextColor,
              ),
              FxText(
                job ?? AppLocalizations.of(context)!.driver,
                tag: Tag.h5,
              ),
            ],
            [
              FxText(
                AppLocalizations.of(context)!.city,
                tag: Tag.h5,
                align: TextAlign.start,
                color: InitialStyle.titleTextColor,
              ),
              FxText(
                city ?? AppLocalizations.of(context)!.cityname,
                tag: Tag.h5,
              ),
            ],
            [
              FxText(
                AppLocalizations.of(context)!.address,
                tag: Tag.h5,
                align: TextAlign.start,
                color: InitialStyle.titleTextColor,
              ),
              FxText(
                address ?? AppLocalizations.of(context)!.loremmid,
                tag: Tag.h5,
              ),
            ],
            [
              FxText(
                AppLocalizations.of(context)!.phone,
                tag: Tag.h5,
                align: TextAlign.start,
                color: InitialStyle.titleTextColor,
              ),
              FxText(
                phone ?? "141144314",
                tag: Tag.h5,
              ),
            ],
            [
              FxText(
                AppLocalizations.of(context)!.email,
                tag: Tag.h5,
                align: TextAlign.start,
                color: InitialStyle.titleTextColor,
              ),
              FxText(
                email ?? "example@gmail.com",
                tag: Tag.h5,
              ),
            ],
          ],
          columnTitle: [
            Container(),
            Container(),
          ],
        ),
      )
    );
  }
}
