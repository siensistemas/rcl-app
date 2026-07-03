class EnvConfig {
  EnvConfig._();

  static String get apiUrl => const String.fromEnvironment(
    'API_URL',
    defaultValue: 'http://localhost:8000/api/v1',
  );

  static String get mapsApiKey => const String.fromEnvironment(
    'MAPS_API_KEY',
    defaultValue: '',
  );

  static String get firebaseSenderId => const String.fromEnvironment(
    'FIREBASE_SENDER_ID',
    defaultValue: '',
  );

  static bool get isDevelopment => const bool.fromEnvironment(
    'DEV_MODE',
    defaultValue: true,
  );

  static bool get isProduction => !isDevelopment;
}
