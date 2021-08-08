import 'package:flutter/material.dart';
import 'package:sqlite_demo/qrcode/qr_create_screen.dart';

import 'qr_scan_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(
                image: NetworkImage(
                    "https://media.istockphoto.com/vectors/qr-code-scan-phone-icon-in-comic-style-scanner-in-smartphone-vector-vector-id1166145556")),
            flatButton("Scan QR CODE", QRScanScreen()),
            SizedBox(
              height: 20.0,
            ),
            flatButton("Generate QR CODE", QRCreateScreen()),
          ],
        ),
      ),
    );
  }

  Widget flatButton(String text, Widget widget) {
    return ElevatedButton(
        onPressed: () async {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => widget));
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom());
  }
}
