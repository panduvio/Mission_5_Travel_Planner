import 'package:flutter/widgets.dart';

extension PaddingExtension on Widget {
  Widget paddingAll(double size) =>
      Padding(padding: EdgeInsetsGeometry.all(size), child: this);

  Widget paddingSymmetrical(double? x, double? y) => Padding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: x ?? 0, vertical: y ?? 0),
    child: this,
  );

  Widget paddingTBRL(
    double? top,
    double? bottom,
    double? right,
    double? left,
  ) => Padding(
    padding: EdgeInsetsGeometry.only(
      top: top ?? 0,
      bottom: bottom ?? 0,
      right: right ?? 0,
      left: left ?? 0,
    ),
    child: this,
  );
}
