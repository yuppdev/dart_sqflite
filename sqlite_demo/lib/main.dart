import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqlite_demo/qrcode/homesreen.dart';
import 'package:sqlite_demo/qrcode/qr_create_screen.dart';
import 'package:sqlite_demo/qrcode/qr_new.dart';
import 'package:sqlite_demo/sqlite_demo/sqflite_demo.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // runApp(MyApp());
  // runApp(SqfliteDemo());
  runApp(HomeScreen());
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
      home: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => SqfliteDemo()));
              },
              child: Text('sqflite'),
            ),
          ],
        ),
      )
      // SqfliteDemo(), // import 'package:sqlite_demo/sqlite_demo/sqflite_demo.dart';
      );
}
