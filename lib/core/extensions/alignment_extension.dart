import 'package:flutter/material.dart';

extension AlignmentExtension on Widget {
  Widget withAlignment(Alignment alignment) =>
      Align(alignment: alignment, child: this);
}
