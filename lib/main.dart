import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/app.dart';
import 'package:rcl_app/core/storage/local_storage.dart';
import 'package:rcl_app/di/app_injection.dart';
import 'package:rcl_app/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  runApp(const RCLApp());
}

Future<void> initApp() async {
  await AppInjection.setup();
  await GetIt.instance<LocalStorage>().init();
  final notificationService = GetIt.instance<NotificationService>();
  await notificationService.init();
}
