import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masteringlayoutwidtree56applyglobalthemes_customizingandextendingtheglobaltheme/custom_theme.dart';

import 'package:masteringlayoutwidtree56applyglobalthemes_customizingandextendingtheglobaltheme/main.dart';

// This is the main function where the test starts.
void main() {
  // This is a group of widget tests described by the String 'Custom Global Theme Extension Test'.
  testWidgets('Custom Global Theme Extension Test',
      (WidgetTester tester) async {
    // This line creates an instance of 'MyApp' and gets its global theme.
    // The global theme is stored in the variable 'globalTheme'.
    final globalTheme = const MyApp().globalTheme();

    // This line tells the tester to build the MyApp widget in the test environment.
    await tester.pumpWidget(MyApp());

    // This line finds the AppBar widget in the widget tree and stores it in the variable 'appBar'.
    AppBar appBar = tester.widget(find.byType(AppBar));
    // This line checks if the color of the AppBar's title text is the same as the custom color defined in the global theme.
    expect(appBar.titleTextStyle?.color, equals(globalTheme.customColor));

    // This line finds the FlatButton widget in the widget tree and stores it in the variable 'flatButton'.
    FlatButton flatButton = tester.widget(find.byType(FlatButton));
    // This line checks if the color of the FlatButton is the same as the custom button color defined in the global theme.
    expect(flatButton.color, equals(globalTheme.customButtonColor));

    // This line finds the IconButton widget in the widget tree (which is used to open the Drawer) and simulates a tap on it.
    await tester.tap(find.byType(IconButton));
    // This line tells the tester to build all remaining widget frames until there are no frames left to build.
    // This is necessary because opening the Drawer is an animation that consists of multiple frames.
    await tester.pumpAndSettle();

    // This line finds the DrawerHeader widget in the widget tree and stores it in the variable 'drawerHeader'.
    DrawerHeader drawerHeader = tester.widget(find.byType(DrawerHeader));
    // This line checks if the color of the DrawerHeader's decoration is the same as the custom drawer color defined in the global theme.
    expect((drawerHeader.decoration as BoxDecoration).color,
        equals(globalTheme.customDrawerColor));
  });
}
