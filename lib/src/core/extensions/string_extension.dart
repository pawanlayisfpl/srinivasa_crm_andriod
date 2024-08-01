extension StringFormat on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String toReverse() {
    return split('').reversed.join();
  }
}