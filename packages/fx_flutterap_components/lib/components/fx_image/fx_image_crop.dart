import 'package:crop_image/crop_image.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';

class FxImageCrop extends StatefulWidget {
  final String imagePath;
  final double aspectRatio;

  const FxImageCrop({
    Key? key,
    required this.imagePath,
    required this.aspectRatio,
  }) : super(key: key);

  @override
  State<FxImageCrop> createState() => _FxImageCropState();
}

class _FxImageCropState extends State<FxImageCrop> {
  CropController _controller = CropController(
    aspectRatio: 1,
    defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
  );
  late Image _image;
  bool _isCropped = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _image = Image.asset(widget.imagePath);
    _controller = CropController(
      aspectRatio: widget.aspectRatio,
      defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: _isCropped
            ? _image
            : CropImage(
                controller: _controller,
                image: _image,

                // paddingSize: InitialDims.space5 ,
                // alwaysMove: true,
              ),
      ),
      floatingActionButton: _isCropped
          ? Container()
          : FloatingActionButton(
              backgroundColor: InitialStyle.buttonColor,
              child: const Icon(Icons.crop),
              onPressed: () async {
                await Future.delayed(
                    const Duration(milliseconds: 500), _finished);
              },
            ),
    );
  }

  Future<void> _finished() async {
    final newImage = await _controller.croppedImage();

    setState(() {
      _image = newImage;
      _isCropped = true;
    });
  }
}
