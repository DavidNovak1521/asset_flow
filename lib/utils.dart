// Function to generate a Dart static constant variable declaration from a given file path
String returnVariableFromPath(String path) {
  // Initialize the string with the starting portion of the variable declaration
  String toReturn = '  static const String ';

  // Append the formatted file name derived from the last part of the path
  toReturn += formatFileName(path.split('/').last);

  // Complete the variable declaration by appending the original path and a line break
  toReturn += ' = \'$path\';\n';

  // Return the final formatted string representing the variable declaration
  return toReturn;
}

// Function to format a file name by capitalizing the first letter of each word
String formatFileName(String fileName) {
  // Split the file name into parts using specified delimiters
  List<String> parts = splitString(fileName, [' ', '_', '-', '.']);

  // Combine the parts by capitalizing the first letter of each word
  String formattedString =
      parts.first + parts.sublist(1).map((part) => part.capitalize()).join();

  // Return the formatted file name
  return formattedString;
}

// Function to split a string using specified delimiters and remove empty parts
List<String> splitString(String input, List<String> delimiters) {
  // Create a regular expression pattern by escaping each delimiter and joining them with '|'
  String pattern = delimiters.map((d) => RegExp.escape(d)).join('|');

  // Split the input string using the generated regular expression pattern
  List<String> parts = input.split(RegExp(pattern));

  // Remove any empty parts from the resulting list
  parts.removeWhere((part) => part.isEmpty);

  // Return the list of non-empty parts
  return parts;
}

// Extension method for String to capitalize the first letter
extension StringExtension on String {
  // Method to capitalize the first letter of a string
  String capitalize() {
    // Capitalize the first letter by converting it to uppercase
    // and concatenate it with the rest of the string starting from the second character
    return this[0].toUpperCase() + substring(1);
  }
}
