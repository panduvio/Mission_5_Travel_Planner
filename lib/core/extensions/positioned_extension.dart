import 'package:flutter/material.dart';

extension PositionedExtension on Widget {
  Widget withPositioned(
    double? top,
    double? bottom,
    double? left,
    double? right,
  ) => Positioned(
    top: top ?? 0,
    bottom: bottom ?? 0,
    left: left ?? 0,
    right: right ?? 0,
    child: this,
  );
}
