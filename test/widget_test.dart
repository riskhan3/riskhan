import 'package:flutter_test/flutter_test.dart';
import 'package:indikhan/main.dart';
import 'package:indikhan/features/splash/screens/splash_screen.dart';

void main() {
  testWidgets('Splash screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const IndiKhanApp());

    // Verify that Splash Screen is displayed
    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.text('IndiKhan'), findsOneWidget);
  });
}
