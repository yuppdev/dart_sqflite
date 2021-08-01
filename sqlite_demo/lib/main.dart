import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqlite_demo/sqlite_demo/sqflite_demo.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // runApp(MyApp());
  runApp(SqfliteDemo());
}

class MyApp extends StatelessWidget {
  static final String title = 'Notes SQLite';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.blueGrey.shade900,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        // home: NotesPage(),  // import 'package:sqlite_demo/page/notes_page.dart';
        home:
            SqfliteDemo(), // import 'package:sqlite_demo/sqlite_demo/sqflite_demo.dart';
      );
}
