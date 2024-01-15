import 'package:flutter/material.dart';

// late String _path;
class FxLightBoxShowing extends StatelessWidget {
  final String path;

  const FxLightBoxShowing({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(path),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return _DetailScreen(
            path: path,
          );
        }));
      },
    );
  }
}

class _DetailScreen extends StatelessWidget {
  final String path;

  const _DetailScreen({required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffB3B3B3),
      body: GestureDetector(
        child: Center(
          child: Container(color: Colors.black26, child: Image.asset(path)),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
