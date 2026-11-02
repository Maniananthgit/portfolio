import 'package:flutter_test/flutter_test.dart';
import 'package:maniananth_portfolio/main.dart';

void main() {
  testWidgets('PortfolioApp loads smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    expect(find.byType(PortfolioApp), findsOneWidget);
  });
}
