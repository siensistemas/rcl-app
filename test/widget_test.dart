import 'package:flutter_test/flutter_test.dart';
import 'package:rcl_app/app.dart';

void main() {
  testWidgets('App renders', (WidgetTester tester) async {
    await tester.pumpWidget(const RCLApp());
    expect(find.byType(RCLApp), findsOneWidget);
  });
}
