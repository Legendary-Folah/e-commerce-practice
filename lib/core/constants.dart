import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  Constants._();

  static String get iosApiKey =>
      dotenv.env['IOS_API_KEY'] ?? 'default_ios_api_key';
  static String get androidApiKey =>
      dotenv.env['ANDROID_API_KEY'] ?? 'default_android_api_key';
  static String get webApiKey =>
      dotenv.env['WEB_API_KEY'] ?? 'default_web_api_key';
  static String get macosApiKey =>
      dotenv.env['MACOS_API_KEY'] ?? 'default_macos_api_key';
  static String get windowsApiKey =>
      dotenv.env['WINDOWS_API_KEY'] ?? 'default_windows_api_key';
}
