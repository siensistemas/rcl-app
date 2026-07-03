import 'package:flutter/material.dart';

class AppConfig {
  AppConfig._();

  static const String appName = 'RCL - Red Comercial Local';
  static const String appVersion = '1.0.0';
  static const String packageName = 'com.rcl.rcl_app';

  static const Locale defaultLocale = Locale('es');
  static const List<Locale> supportedLocales = [
    Locale('es'),
    Locale('en'),
  ];

  static const double defaultPadding = 16.0;
  static const double borderRadius = 12.0;

  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;

  static const int itemsPerPage = 20;
  static const double defaultMapZoom = 14.0;
  static const double searchRadius = 5.0;
}
