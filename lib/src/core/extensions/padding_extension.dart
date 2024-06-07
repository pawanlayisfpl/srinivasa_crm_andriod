import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget withPadding({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  Widget withAllPadding({double value = 8.0}) {
    return Padding(padding: EdgeInsets.all(value));
  }

  Widget withSymetricPadding(
      {double horizontalPadding = 0.0, double verticalPadding = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: this,
    );
  }
}
