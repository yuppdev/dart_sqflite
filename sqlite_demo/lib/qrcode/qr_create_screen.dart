import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCreateScreen extends StatefulWidget {
  @override
  _QRCreateScreenState createState() => _QRCreateScreenState();
}

class _QRCreateScreenState extends State<QRCreateScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // QrImage(
              //   data: controller.text,
              //   version: QrVersions.auto,
              //   size: 200,
              //   backgroundColor: Colors.white,
              // ),
              SizedBox(
                height: 40,
              ),
              buildTextField(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) => TextField(
        controller: controller,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        decoration: InputDecoration(
            hintText: 'Enter the data',
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Theme.of(context).accentColor)),
            suffixIcon: IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(
                Icons.done,
                size: 30,
              ),
              onPressed: () {},
            )),
      );
}
