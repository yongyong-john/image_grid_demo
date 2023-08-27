import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

class DetectPlatForm {
  static String getOSName() {
    var osName = 'ETC';
    if (Platform.isIOS) {
      osName = 'IOS';
    } else if (Platform.isAndroid) {
      osName = 'AND';
    } else if (Platform.isWindows) {
      osName = 'WIN';
    }
    print('mobileOS=$osName');
    return osName;
  }

  static Future<PackageInfo> getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }
}
