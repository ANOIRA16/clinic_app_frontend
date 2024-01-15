import 'package:fx_flutterap_kernel/structure/default_configs.dart';

abstract class StructureConfig {
  late String _fontFamily;

  late String _lorem;

  late String _loremTitle;

  StructureConfig() {
    _fontFamily = DefaultConfigs.fontFamily;
    _lorem = DefaultConfigs.lorem;
    _loremTitle = DefaultConfigs.loremTitle;
  }
}

class InitialConfig extends StructureConfig {
  static late String fontFamily;

  static late String lorem;

  static late String loremTitle;

  InitialConfig({
    String? fontFamily,
    String? lorem,
    String? loremTitle,
  }) : super() {
    InitialConfig.fontFamily = fontFamily ?? super._fontFamily;
    InitialConfig.lorem = lorem ?? super._lorem;
    InitialConfig.loremTitle = loremTitle ?? super._loremTitle;
  }
}

class LanguageConfig extends StructureConfig {
  static late String fontFamily;

  static late String lorem;

  static late String loremTitle;

  LanguageConfig({
    String? fontFamily,
    String? lorem,
    String? loremTitle,
  }) : super() {
    InitialConfig.fontFamily = "Arabic";
    InitialConfig.lorem = lorem ?? super._lorem;
    InitialConfig.loremTitle = loremTitle ?? super._loremTitle;
  }
}
