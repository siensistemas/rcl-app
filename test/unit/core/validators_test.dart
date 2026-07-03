import 'package:flutter_test/flutter_test.dart';
import 'package:rcl_app/core/utils/validators.dart';

void main() {
  group('Validators', () {
    test('required returns error for empty value', () {
      expect(Validators.required(''), isNotNull);
      expect(Validators.required(null), isNotNull);
      expect(Validators.required('text'), isNull);
    });

    test('email returns error for invalid email', () {
      expect(Validators.email('not-email'), isNotNull);
      expect(Validators.email(''), isNotNull);
      expect(Validators.email('test@example.com'), isNull);
    });

    test('password returns error for short password', () {
      expect(Validators.password('12345'), isNotNull);
      expect(Validators.password('123456'), isNull);
    });
  });
}
