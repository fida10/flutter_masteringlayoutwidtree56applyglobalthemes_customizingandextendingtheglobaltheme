/*
Practice Question 2: Customizing and Extending the Global Theme

Task Description:
Extend your application by customizing the global theme. Add custom colors, fonts, and styles to your theme and ensure they are applied across various widgets in your app, such as custom FlatButton styles, AppBar titles, and Drawer headers.
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masteringlayoutwidtree56applyglobalthemes_customizingandextendingtheglobaltheme/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      home: const HomePage(),
    );
  }

  ThemeData globalTheme() {
    final themeData = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: Colors.amber,
        brightness: Brightness.dark,
      ),
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.oswald(
          fontSize: 30,
          fontStyle: FontStyle.italic,
        ),
        bodyLarge:
            GoogleFonts.amarante(fontSize: 42, fontStyle: FontStyle.italic),
        bodyMedium: GoogleFonts.merriweather(),
        displaySmall: GoogleFonts.pacifico(),
      ),
    );

    themeData.customColor = Colors.green;
    themeData.customButtonColor = Colors.blue;
    themeData.customDrawerColor = Colors.red;
    // adding custom fields to theme data via an extension (see custom_theme class for this)

    return themeData;
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        titleTextStyle:
            TextStyle(color: Theme.of(context).customColor, fontSize: 30),
        //use of the global theme, specifically the customColor field
        title: const Text('This is the title'),
      ),
      drawer: Drawer(
        //by default, this adds a hamburger icon on the app bar
        //this icon is a widget of type IconButton
        //for the below to be visible (including the Drawer()), this must be tapped on, as is done in the test case
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).customDrawerColor,
                //use of the global theme, specifically the customDrawerColor field
              ),
              child: const Text('Drawer header!'),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.primary)),
                    //takes a MaterialStatePropery color, not just a raw color, so the MaterialStateProperty.all was necessary for this
                    onPressed: () {},
                    child: Text(
                      'Some text here',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Green blue red :D'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    color: Theme.of(context).customButtonColor,
                    //use of the global theme, specifically the customButtonColor field
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FlatButton extends StatelessWidget {
  final Color? color;

  const FlatButton({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Custom flatButton');
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(color),
      ),
      child: const Text('Custom button text'),
    );
  }
}
