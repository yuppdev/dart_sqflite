import 'package:flutter/material.dart';

class QRNew extends StatefulWidget {
  @override
  _QRNewState createState() => _QRNewState();
}

class _QRNewState extends State<QRNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR New'),
      ),
      body: Container(
        child: Text('content'),
      ),
    );
  }
}
