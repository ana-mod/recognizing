import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'camera_view.dart';
import 'label_detector_paint.dart';

class ImageLabelView extends StatefulWidget {
  @override
  _ImageLabelViewState createState() => _ImageLabelViewState();
}

class _ImageLabelViewState extends State<ImageLabelView> {
  ImageLabeler imageLabeler = GoogleMlKit.vision.imageLabeler();
  bool isBusy = false;
  CustomPaint? customPaint;

  @override
  void dispose() {
    imageLabeler.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Image Labeler',
      customPaint: customPaint,
      onImage: (inputImage) {
        processImage_(inputImage);
      },
    );
  }

  Future<void> processImage_(InputImage inputImage) async {
    imageLabeler = GoogleMlKit.vision.imageLabeler();
    processImage(inputImage);
  }


  Future<void> processImage(InputImage inputImage) async {
    if (isBusy) return;
    isBusy = true;
    await Future.delayed(Duration(milliseconds: 50));
    final labels = await imageLabeler.processImage(inputImage);
    final painter = LabelDetectorPainter(labels);
    customPaint = CustomPaint(painter: painter);
    isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}