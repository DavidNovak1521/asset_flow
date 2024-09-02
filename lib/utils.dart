part of 'asset_flow.dart';

/// Function to get paths of files in the 'assets' directory and its subdirectories.
Future<List<String>> getAssetPaths() async {
  List<String> toReturn = [];

  await for (var entity in Directory('assets').list(recursive: true)) {
    if (entity is File) {
      if (!entity.path.split(Platform.pathSeparator).last.startsWith('.')) {
        if (entity.path.split('.').last != 'ttf') {
          toReturn.add(entity.path);
        }
      }
    }
  }

  return toReturn;
}

/// Function to generate a Dart static constant variable declaration from a given file path.
String returnVariableFromPath(String path) {
  String toReturn = '  static const String ';

  toReturn += formatFileName(path.split('/').last);

  toReturn += ' = \'$path\';\n';

  return toReturn;
}

/// Function to format a file name to camelCase.
String formatFileName(String fileName) {
  List<String> parts = splitString(fileName, [' ', '_', '-', '.']);

  String formattedString = parts.first.toLowerCase() +
      parts.sublist(1).map((part) => part.capitalize()).join();

  return formattedString;
}

/// Function to split a string using specified delimiters and remove empty parts.
List<String> splitString(String input, List<String> delimiters) {
  String pattern = delimiters.map((d) => RegExp.escape(d)).join('|');

  List<String> parts = input.split(RegExp(pattern));

  parts.removeWhere((part) => part.isEmpty);

  return parts;
}

/// Extension method for String to capitalize the first letter.
extension StringExtension on String {
  String capitalize() {
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}
