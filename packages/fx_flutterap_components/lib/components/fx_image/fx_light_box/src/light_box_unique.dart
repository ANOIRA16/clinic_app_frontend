library lightbox;

import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';

import 'image_type.dart';

class LightBoxUnique extends StatefulWidget {
  ///Array of images that will be display by the lightbox
  ///
  /// It may be paths to images in asset or from the user phone or urls for images to be fetch on the Internet
  /// Also can be base64 encoded Strings to be display as bytes
  final String image;

  /// Gives the initial index of the Lightbox
  /// By default it has the value zero
  // final int initialIndex;

  /// This parameter indicates wheter the images parameters are urls,bytes or assets
  /// By default it has value is [ImageType.url]
  final ImageType imageType;

  /// Gives the value of the Gaussian blur
  final double blur;

  ///Icon to close the lightbox
  final Widget? closeIcon;


  /// This is the lightBox widget which is used to display the image as diaporama
  /// with controls
  const LightBoxUnique(
      {Key? key, required this.image,

        this.imageType = ImageType.url,
        this.blur = 2.5,
        this.closeIcon ,
 }) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _LightBoxUniqueState();
  }

}

class _LightBoxUniqueState extends State<LightBoxUnique> {
  late PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller = PageController(
    //     viewportFraction: 1, keepPage: true, initialPage: widget.initialIndex);
  }

  // void changePageViewPosition(int whichPage) {
  //   if (whichPage < widget.images.length && whichPage >= 0) {
  //     controller.jumpToPage(whichPage);
  //   }
  // }

  Widget _widgetToUse(ImageType imageType, String path) {
    if (imageType == ImageType.url) {
      return CachedNetworkImage(
        imageUrl: path,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),

      );
    } else if (imageType == ImageType.asset) {
      return Image.asset(
        path,
      );
    } else if (imageType == ImageType.bytes) {
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: widget.blur,
              sigmaY: widget.blur,
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 100) * 8,
                ),
                GestureDetector(
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
                SizedBox(
                    height: (MediaQuery.of(context).size.height / 100) *80 ,
                    width: (MediaQuery.of(context).size.width / 100) * 80,
                    child:     _widgetToUse(
                        widget.imageType, widget.image)),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
