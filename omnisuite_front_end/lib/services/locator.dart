import 'package:get_it/get_it.dart';
import 'package:omnisuite_front_end/config/router/app_router.dart';

final locator = GetIt.instance;

void initializeDependencies() {
  locator.registerSingleton<AppRouter>(AppRouter());
}