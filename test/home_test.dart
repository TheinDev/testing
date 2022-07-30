
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/models/favorites.dart';
import 'package:testing/screens/home_page.dart';
import 'package:flutter_test/flutter_test.dart';
Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
  create: (context) => Favorites(),
  child: MaterialApp(
    home: HomePage(),
  ),
);

void main() {
  group('Home Page Widget Tests', () {

    testWidgets('Testing IconButtons', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byIcon(Icons.favorite), findsNothing);
      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('Added to favorites.'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsWidgets);
      await tester.tap(find.byIcon(Icons.favorite).first);
      await tester.pumpAndSettle(Duration(seconds: 3));
      expect(find.text('Removed from favorites.'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);
    });


  });
}