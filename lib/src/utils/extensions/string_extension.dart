extension StringExtension on String {
  /// Makes the first letter of this string in uppercase.
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
