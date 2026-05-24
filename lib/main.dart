import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'core/network/api_client.dart';
import 'core/services/services.dart';
import 'providers/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.instance.init();
  ApiClient.instance.init();
  await LocalStorageService.instance.init();
  await ConnectivityService.instance.init();

  runApp(
    MultiProvider(providers: AppProviders.providers, child: const MyApp()),
  );
}
