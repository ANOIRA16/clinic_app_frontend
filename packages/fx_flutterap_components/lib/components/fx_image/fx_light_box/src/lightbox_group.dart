library lightbox;

import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:intl/intl.dart' as intl;

import 'image_type.dart';

class LightBoxGroup extends StatefulWidget {
  ///Array of images that will be display by the lightbox
  ///
  /// It may be paths to images in asset or from the user phone or urls for images to be fetch on the Internet
  /// Also can be base64 encoded Strings to be display as bytes
  final List<String> images;

  /// Gives the initial index of the Lightbox
  /// By default it has the value zero
  final int initialIndex;

  /// This parameter indicates wheter the images parameters are urls,bytes or assets
  /// By default it has value is [ImageType.url]
  final ImageType imageType;

  /// Gives the value of the Gaussian blur
  final double blur;

  ///Icon to close the lightbox
  final Widget? closeIcon;


  /// Close text to be display
  final String closeText;

  /// Close text color
  final Color closeTextColor;

  /// Previous Icon
  final Widget? prevIcon;


  /// Previous button text
  final String prevText;

  /// Previous button text color
  final Color prevTextColor;

  /// Next Icon
  final Widget? nextIcon;


  /// Next button text
  final String nextText;

  /// Next button text color
  final Color nextTextColor;

  /// This is the lightBox widget which is used to display the image as diaporama
  /// with controls
  const LightBoxGroup(
      {Key? key, required this.images,
      this.initialIndex = 0,
      this.imageType = ImageType.url,
      this.blur = 2.5,
      this.closeIcon ,
      this.closeText = 'Close',
      this.closeTextColor = Colors.black,
      this.prevIcon,
      this.prevText = 'Prev',
      this.prevTextColor = Colors.black,
      this.nextIcon,
      this.nextText = 'Next',
      this.nextTextColor = Colors.black}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _LightBoxGroupState();
  }
}

class _LightBoxGroupState extends State<LightBoxGroup> {
  late PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(
        viewportFraction: 1, keepPage: true, initialPage: widget.initialIndex);
  }

  void _changePageViewPosition(int whichPage) {
    if (whichPage < widget.images.length && whichPage >= 0) {
      controller.jumpToPage(whichPage);
    }
  }

  Widget _widgetToUse(ImageType imageType, String path) {
    if (imageType == ImageType.url) {
      return CachedNetworkImage(
        imageUrl: path,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),

      );
    }
    else if (imageType == ImageType.asset) {
      return Image.asset(
        path,
      );
    }
    else if (imageType == ImageType.bytes) {
      return Image.memory(
        base64Decode(path),
      );
    } else {
      return Image.file(
        File(path),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDirectionRTL(BuildContext context) {
      return intl.Bidi.isRtlLanguage(
          Localizations.localeOf(context).languageCode);
    }

    bool rtl = isDirectionRTL(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: widget.blur,
              sigmaY: widget.blur,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 100) * 8,
                ),
                Padding(
                  padding:  EdgeInsets.all(InitialDims.space5),
                  child: GestureDetector(
                    child:  Padding(
                      padding: EdgeInsets.only(
                        right: InitialDims.space5,
                        bottom: InitialDims.space5,),
                      child: widget.closeIcon?? const Icon(Icons.close,color:
                      Colors.white,),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                IntrinsicWidth(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                          color: Colors.transparent,
                          child: InkWell(
                          onTap: () {
                            _changePageViewPosition((controller.page! - 1).round());
                          },
                          child: FxSvgIcon(
                            rtl
                                ?"packages/fx_flutterap_components/assets/svgs/CaretRight.svg"
                                : "packages/fx_flutterap_components/assets/svgs/CaretLeft.svg",
                            color: Colors.white,
                            size: InitialDims.icon5,
                          ))),
      const FxHSpacer(),
                      SizedBox(
                          height: (MediaQuery.of(context).size.height / 100) * 70,
                          width: (MediaQuery.of(context).size.width / 100) * 80,
                          child: PageView.builder(
                              controller: controller,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.images.length,
                              itemBuilder: (context, position) {
                                return _widgetToUse(
                                    widget.imageType, widget.images[position]);
                              })),
      const FxHSpacer(),
                      Material(
                          color: Colors.transparent,
                          child: InkWell(
                          onTap: () {
                            _changePageViewPosition((controller.page! + 1).round());
                          },
                          child: FxSvgIcon(rtl
                              ?"packages/fx_flutterap_components/assets/svgs/CaretLeft.svg"
                              : "packages/fx_flutterap_components/assets/svgs/CaretRight.svg",
                            color: Colors.white,
                            size: InitialDims.icon5,

                          ))),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}