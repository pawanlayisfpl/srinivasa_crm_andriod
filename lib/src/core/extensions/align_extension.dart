import 'package:flutter/material.dart';

extension AlignExtensions on Widget {
  Align alignToCenter() {
    return Align(
      alignment: Alignment.center,
      child: this,
    );
  }

  Align alignToCenterLeft() {
    return Align(
      alignment: Alignment.centerLeft,
      child: this,
    );
  }

  Align alignToCenterRight() {
    return Align(
      alignment: Alignment.centerRight,
      child: this,
    );
  }

  //*top
  Align alignToTopCenter() {
    return Align(
      alignment: Alignment.topCenter,
      child: this,
    );
  }

  Align alignToTopLeft() {
    return Align(
      alignment: Alignment.topLeft,
      child: this,
    );
  }

  Align alginToTopRight() {
    return Align(
      alignment: Alignment.topRight,
      child: this,
    );
  }

  //bottom
  Align aligntoBottmRight() {
    return Align(
      alignment: Alignment.bottomRight,
      child: this,
    );
  }

  Align alignToBottomLeft() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: this,
    );
  }

  Align alignToBottomCenter() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: this,
    );
  }
}
