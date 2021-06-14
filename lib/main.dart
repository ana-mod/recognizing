import 'dart:io';

import 'package:camera/camera.dart';

import 'text_detector_view.dart';
import 'label_detector_view.dart';

import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ML Kit App'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomCard(
                'Image Label Detector',
                ImageLabelView(),
              ),
              CustomCard(
                'Text Detector',
                TextDetectorView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String _label;
  final Widget _viewPage;

  const CustomCard(this._label, this._viewPage);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
          tileColor: Theme.of(context).primaryColor,
          title: Text(
            _label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => _viewPage));
          }),
    );
  }
}
