import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/config/app_config.dart';
import 'core/config/app_config_dev.dart';
import 'core/di/service_locator.dart';
import 'core/routing/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.init(buildDevConfig());
  await setupServiceLocator();
  runApp(NabzApp(router: buildAppRouter()));
}
