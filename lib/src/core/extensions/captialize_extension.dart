extension StringExtension on String {
  String toCapitalize() {
    return split(" ")
        .map((str) => "${str[0].toUpperCase()}${str.substring(1)}")
        .join(" ");
  }
}
