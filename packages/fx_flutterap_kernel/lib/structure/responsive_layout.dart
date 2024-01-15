import 'package:flutter/cupertino.dart';

class ResponsiveLayot extends StatelessWidget {
  final Widget tiny;
  final Widget phone;
  final Widget tablet;
  final Widget largTablet;
  final Widget mediumComputer;
  final Widget computer;

  const ResponsiveLayot(
      {Key? key, required this.tiny,
        required this.phone,
        required this.tablet,
        required this.largTablet,
        required this.mediumComputer,
        required this.computer,
      }) : super(key: key);

  static const double tinyHightLimit = 100;
  static const double tinyLimit = 270;
  static const double phoneLimit = 550;
  static const double tabletLimit = 800;
  static const double largTabletLimit = 1100;
  static const double mediumComputerLimit = 1300;


  static bool isTinyHightLimit(BuildContext context)=>
      MediaQuery.of(context).size.height<tinyHightLimit;
  static bool isTinyLimit(BuildContext context)=>
      MediaQuery.of(context).size.width<tinyLimit;
  static bool isPhone(BuildContext context)=>
      MediaQuery.of(context).size.width<phoneLimit &&
          MediaQuery.of(context).size.width>=tinyLimit;
  static bool isTablet(BuildContext context)=>
      MediaQuery.of(context).size.width<tabletLimit &&
          MediaQuery.of(context).size.width>=phoneLimit;
  static bool isLargeTablet(BuildContext context)=>
      MediaQuery.of(context).size.width<largTabletLimit &&
          MediaQuery.of(context).size.width>=tabletLimit;
  static bool isMediumComputer(BuildContext context)=>
      MediaQuery.of(context).size.width<mediumComputerLimit &&
          MediaQuery.of(context).size.width>=largTabletLimit;

  static bool isComputer(BuildContext context)=>
      MediaQuery.of(context).size.width>=mediumComputerLimit;



  @override
  Widget build(BuildContext context) {
    double   width=
    MediaQuery.of(context).size.width;
    double   height=
    MediaQuery.of(context).size.height;

    return _body(width,height);
  }

  Widget _body(double width,double height) {
    if(width< tinyLimit||height<tinyHightLimit){
      return tiny;
    }
    else if(width < phoneLimit){
      return phone;
    }
    else if(width < tabletLimit){
      return tablet;
    }
    else if(width< largTabletLimit){
      return largTablet;
    }
    else if(width< mediumComputerLimit){
      return mediumComputer;
    }else{
      return computer;
    }

  }

}