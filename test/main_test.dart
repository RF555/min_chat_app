import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:min_chat_app/main.dart';
import 'package:min_chat_app/services/auth/auth_gate.dart';
import 'package:min_chat_app/themes/theme_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

// Create mock class
class MockThemeProvider extends Mock implements ThemeProvider {
  @override
  ThemeData get themeData => ThemeData.light();
}

class MockAuthGate extends StatelessWidget implements AuthGate {
  const MockAuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Fake Auth Gate'),
      ),
    );
  }
}

void main() {
  group('Main App Tests', () {
    late MockThemeProvider mockThemeProvider;

    setUp(() {
      mockThemeProvider = MockThemeProvider();
    });

    testWidgets('App should build without errors', (WidgetTester tester) async {
      // Build our app with the mocked dependencies
      await tester.pumpWidget(
        ChangeNotifierProvider<ThemeProvider>.value(
          value: mockThemeProvider,
          child: MyApp(authGate: const MockAuthGate()),
        ),
      );
      
      // Verify that the app builds without errors
      expect(find.byType(MyApp), findsOneWidget);
      expect(find.text('Fake Auth Gate'), findsOneWidget);
    });
  });
} 