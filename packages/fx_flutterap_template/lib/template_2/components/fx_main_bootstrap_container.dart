import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import '../structure/structure_dims.dart';
import '../structure/structure_styles.dart';

import 'fx_page_header.dart';
import 'fx_page_title_container.dart';

class FxMainBootstrapContainer extends StatelessWidget {
  final List list;
  final String title;
  final String? description;
  final String? firstRoute;
  final String? bootstrapSizes;
  final GlobalKey? descriptionKey;
  final String? information;
  final GlobalKey? informationKey;
  final ScrollController? scrollController;

  const FxMainBootstrapContainer({
    Key? key,
    required this.list,
    required this.title,
    this.description,
    this.firstRoute,
    this.bootstrapSizes,
    this.descriptionKey,
    this.information,
    this.informationKey,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: InitialDims.space0);
    return Material(
        color: InitialStyle.background,
        child: Scaffold(
          backgroundColor: InitialStyle.background,
          body: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                FxPageHeader(title:title , firstRoute: firstRoute,),
                description==null
                    ?Container()
                    :FxPageTitleContainer(
                  descriptionKey: descriptionKey,
                  description: description??"",
                  information: information,
                  informationKey: informationKey,
                ),
                BootstrapContainer(
                    fluid: true,
                    padding: EdgeInsets.all(InitialDims.space3),
                    decoration: BoxDecoration(
                      color: InitialStyle.background,
                    ),
                    children: List.generate(
                        list.length,
                        (index) =>
                            boxShow(list[index], setting: bootstrapSizes)))
              ],
            ),
          ),
        ));
  }

  Widget boxShow(Widget widget, {String? setting}) {
    return BootstrapCol(
        sizes: setting ?? 'col-sm-12 col-ml-12 col-lg-6 col-xl-6',
        child: widget);
  }
}
