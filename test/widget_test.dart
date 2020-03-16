import 'package:flutter_test/flutter_test.dart';

import 'package:omikuji/main.dart';

void main() {
  testWidgets('app bar test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('おみくじ'), findsOneWidget);
  });
}
