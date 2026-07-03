class ApiConstants {
  ApiConstants._();

  static const String baseUrl = String.fromEnvironment('API_URL', defaultValue: 'http://localhost:8000/api/v1');
  static const bool isDevelopment = bool.fromEnvironment('DEV_MODE', defaultValue: true);

  static const String login = '/auth/login/';
  static const String register = '/auth/register/';
  static const String refreshToken = '/auth/refresh/';
  static const String logout = '/auth/logout/';
  static const String forgotPassword = '/auth/forgot-password/';
  static const String verifyEmail = '/auth/verify-email/';

  static const String businesses = '/businesses/';
  static const String categories = '/categories/';
  static const String promotions = '/promotions/';
  static const String coupons = '/coupons/';
  static const String events = '/events/';
  static const String jobs = '/jobs/';
  static const String classifieds = '/classifieds/';
  static const String tourism = '/tourism/';
  static const String notifications = '/notifications/';

  static const String users = '/users/';
  static const String profile = '/users/profile/';
  static const String merchant = '/merchant/';
  static const String merchantStats = '/merchant/stats/';
  static const String uploadMedia = '/upload/media/';
}
