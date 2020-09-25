import 'package:package_info/package_info.dart';

Future<String> getAppVersion() async {
  final package = await PackageInfo.fromPlatform();
  return package.version;
}
