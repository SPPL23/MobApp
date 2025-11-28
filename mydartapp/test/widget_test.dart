import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mydartapp/main.dart';

void main() {
  testWidgets('two text fields and FAB read/display names', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const MyApp());
    final name1Finder = find.text('Enter name 1');
    final name2Finder = find.text('Enter name 2');

    expect(name1Finder, findsOneWidget);
    expect(name2Finder, findsOneWidget);

    final textFields = find.byType(TextField);
    expect(textFields, findsNWidgets(2));

    await tester.enterText(textFields.at(0), 'Alice');
    await tester.enterText(textFields.at(1), 'Bob');

    await tester.tap(find.byKey(const Key('saveButton')));
    await tester.pumpAndSettle();

    expect(find.textContaining('Name 1: Alice'), findsWidgets);
    expect(find.textContaining('Name 2: Bob'), findsWidgets);
    expect(find.textContaining('Relationship: Affection'), findsWidgets);

    var prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('name1'), 'Alice');
    expect(prefs.getString('name2'), 'Bob');
    final results = prefs.getStringList('results') ?? [];
    expect(results.length, 1);
    expect(results.first, contains('Name 1: Alice'));

    await tester.enterText(textFields.at(0), 'Carol');
    await tester.enterText(textFields.at(1), 'Dan');
    await tester.tap(find.byKey(const Key('computeFab')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('computedResultCard')), findsOneWidget);
    expect(find.textContaining('Name 1: Carol'), findsWidgets);
    expect(find.textContaining('Name 2: Dan'), findsWidgets);

    final okFinder = find.text('OK');
    expect(okFinder, findsOneWidget);
    await tester.tap(okFinder);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('saveButton')));
    await tester.pumpAndSettle();

    prefs = await SharedPreferences.getInstance();
    final results2 = prefs.getStringList('results') ?? [];
    expect(results2.length, 2);
    expect(results2.last, contains('Name 1: Carol'));
    expect(results2.last, contains('Name 2: Dan'));

    await tester.tap(find.byKey(const Key('clearButton')));
    await tester.pumpAndSettle();

    prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('name1'), isNull);
    expect(prefs.getString('name2'), isNull);
    final clearedResults = prefs.getStringList('results');
    expect(clearedResults == null || clearedResults.isEmpty, true);
    expect(find.byKey(const Key('computedResultCard')), findsNothing);
    expect(find.textContaining('Alice & Bob —'), findsNothing);
    expect(find.textContaining('Carol & Dan'), findsNothing);
  });
}
