import 'dart:ui';
import 'package:google_ml_kit/google_ml_kit.dart';

double translateX(
    double x, InputImageRotation rotation, Size size, Size absoluteImageSize) {
  switch (rotation) {
    case InputImageRotation.Rotation_90deg:
      return x * size.width / absoluteImageSize.width;
    case InputImageRotation.Rotation_270deg:
      return size.width - x * size.width / absoluteImageSize.width;
    default:
      return x * size.width / absoluteImageSize.width;
  }
}

double translateY(
    double y, InputImageRotation rotation, Size size, Size absoluteImageSize) {
  switch (rotation) {
    case InputImageRotation.Rotation_90deg:
    case InputImageRotation.Rotation_270deg:
      return y * size.height / absoluteImageSize.height;
    default:
      return y * size.height / absoluteImageSize.height;
  }
}
